import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_bloc.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_state.dart';

class InfoHotelWidget extends StatelessWidget {
  const InfoHotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is BookingLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BookingLoadState) {
          return Padding(
            padding: EdgeInsets.all(16),
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
                      Text('${state.bookingModel.horating}',
                          style: AppTextTheme.basicRating),
                      const SizedBox(
                        width: 2,
                      ),
                      Text('${state.bookingModel.ratingName}',
                          style: AppTextTheme.basicRating)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('${state.bookingModel.hotelName}',
                    style: AppTextTheme.basicName),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '${state.bookingModel.hotelAdress}',
                    style: AppTextTheme.basicAddress,
                  ),
                ),
              ],
            ),
          );
        } else if (state is BookingErrorState) {
          return const Center(
            child: Text(
              'Error info hotel',
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
