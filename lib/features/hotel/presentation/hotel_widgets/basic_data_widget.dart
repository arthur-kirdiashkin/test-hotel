import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_bloc.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_state.dart';

class BasicDataWidget extends StatelessWidget {
  const BasicDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HotelLoadState) {
          return Padding(
            // padding: EdgeInsets.only(left: 16),
            padding: EdgeInsets.only(left: width * 0.042),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 199, 0, 0.2),
                      borderRadius: BorderRadius.circular(5)),
                  height: 29,
                  width: 149,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset('assets/star.svg'),
                      const SizedBox(
                        width: 2,
                      ),
                      Text('${state.hotelModel.rating}',
                          style: AppTextTheme.basicRating),
                      const SizedBox(
                        width: 2,
                      ),
                      Text('${state.hotelModel.ratingName}',
                          style: AppTextTheme.basicRating)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('${state.hotelModel.name}', style: AppTextTheme.basicName),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '${state.hotelModel.adress}',
                    style: AppTextTheme.basicAddress,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text('от ${state.hotelModel.minimalPrice} р',
                        style: AppTextTheme.minimalPrice),
                    const SizedBox(
                      width: 8,
                    ),
                    Text('${state.hotelModel.priceForIt}',
                        style: AppTextTheme.priceForIt)
                  ],
                )
              ],
            ),
          );
        } else if (state is HotelErrorState) {
          return const Center(
            child: Text(
              'Error basic data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
