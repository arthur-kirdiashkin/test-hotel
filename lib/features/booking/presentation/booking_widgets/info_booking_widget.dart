import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_bloc.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_state.dart';

class InfoBookingWidget extends StatelessWidget {
  const InfoBookingWidget({super.key});

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
          List<String> info = [
            'Вылет из',
            'Страна, город',
            'Даты',
            'Кол-во ночей',
            'Отель',
            'Номер',
            'Питание',
          ];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      RowInfoWidget(
                        width: 76,
                        info: info[0],
                        infoHotel: state.bookingModel.departure,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RowInfoWidget(
                        width: 39,
                        info: info[1],
                        infoHotel: state.bookingModel.arrivalCountry,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RowDateWidget(
                        width: 102,
                        info: info[2],
                        dateStart: state.bookingModel.tourDateStart,
                        dateStop: state.bookingModel.tourDateStop,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RowNightWidget(
                        width: 45,
                        info: info[3],
                        numberNight: state.bookingModel.numberOfNights,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RowHotelWidget(
                        width: 98,
                        info: info[4],
                        infoHotel: state.bookingModel.hotelName,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RowInfoWidget(
                        width: 92,
                        info: info[5],
                        infoHotel: state.bookingModel.room,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RowInfoWidget(
                        width: 80,
                        info: info[6],
                        infoHotel: state.bookingModel.nutrition,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class RowInfoWidget extends StatelessWidget {
  final String? info;
  final String? infoHotel;
  final double? width;
  const RowInfoWidget(
      {super.key,
      required this.info,
      required this.infoHotel,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          info!,
          style: AppTextTheme.priceForIt,
        ),
        SizedBox(
          width: width,
        ),
        Text(
          infoHotel!,
          style: AppTextTheme.hotelDescription,
        ),
      ],
    );
  }
}

class RowDateWidget extends StatelessWidget {
  final String? info;
  final String? dateStart;
  final String? dateStop;
  final double? width;
  const RowDateWidget({
    super.key,
    required this.info,
    required this.dateStart,
    required this.dateStop,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          info!,
          style: AppTextTheme.priceForIt,
        ),
        SizedBox(
          width: width,
        ),
        Text(
          '$dateStart - $dateStop',
          style: AppTextTheme.hotelDescription,
        ),
      ],
    );
  }
}

class RowNightWidget extends StatelessWidget {
  final String? info;
  final int? numberNight;
  final double? width;
  const RowNightWidget(
      {super.key,
      required this.info,
      required this.numberNight,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          info!,
          style: AppTextTheme.priceForIt,
        ),
        SizedBox(
          width: width,
        ),
        Text(
          '$numberNight ночей',
          style: AppTextTheme.hotelDescription,
        ),
      ],
    );
  }
}

class RowHotelWidget extends StatelessWidget {
  final String? info;
  final String? infoHotel;
  final double? width;
  const RowHotelWidget(
      {super.key,
      required this.info,
      required this.infoHotel,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          info!,
          style: AppTextTheme.priceForIt,
        ),
        SizedBox(
          width: width,
        ),
        SizedBox(
          width: 180,
          child: Text(
            infoHotel!,
            style: AppTextTheme.hotelDescription,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
