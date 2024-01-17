import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_bloc.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_state.dart';
import 'package:testovoe_hotel/features/number/presentation/room_bloc/room_bloc.dart';
import 'package:testovoe_hotel/features/number/presentation/room_bloc/room_state.dart';
import 'package:testovoe_hotel/features/number/presentation/room_widgets/one_room_widget.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 65,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset('assets/vector-3.svg')),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        BlocBuilder<HotelBloc, HotelState>(
                          builder: (context, state) {
                            if (state is HotelLoadState) {
                              return SizedBox(
                                width: 250,
                                child: Text(
                                  '${state.hotelModel.name}',
                                  style: AppTextTheme.roomBasicName,
                                  softWrap: true,
                                  maxLines: 2,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<RoomBloc, RoomState>(builder: (context, state) {
              if (state is RoomLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RoomLoadState) {
                return MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.roomsmodel.rooms!.length,
                    itemBuilder: (context, index) {
                      return OneRoomWidget(
                          id: state.roomsmodel.rooms![index].id,
                          name: state.roomsmodel.rooms![index].name,
                          price: state.roomsmodel.rooms![index].price,
                          pricePer: state.roomsmodel.rooms![index].pricePer,
                          peculiarities:
                              state.roomsmodel.rooms![index].peculiarities,
                          imageUrls: state.roomsmodel.rooms![index].imageUrls);
                    },
                  ),
                );
              } else if (state is RoomErrorState) {
          return const Center(
            child: Text(
              'Error room page',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          );
        }
              return const SizedBox.shrink();
            })
          ],
        ),
      ),
    );
  }
}
