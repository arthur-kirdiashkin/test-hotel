import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_bloc.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_state.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/info_customer_widget.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/tourist_widget.dart';
import 'package:testovoe_hotel/features/booking/presentation/paid_page/paid_page.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is BookingLoadState) {
          List<String> infoPrice = [
            'Тур',
            'Топливный сбор',
            'Сервисный сбор',
            'К оплате',
          ];
          return Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  RowTotalPriceWidget(
                    info: infoPrice[0],
                    price: state.bookingModel.tourPrice,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RowTotalPriceWidget(
                    info: infoPrice[1],
                    price: state.bookingModel.fuelCharge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RowTotalPriceWidget(
                    info: infoPrice[2],
                    price: state.bookingModel.serviceCharge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RowTotalPriceWidget(
                    info: infoPrice[3],
                    price: state.bookingModel.tourPrice! +
                        state.bookingModel.fuelCharge! +
                        state.bookingModel.serviceCharge!,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: const Color.fromRGBO(13, 114, 255, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      if ((phoneKey.currentState!.validate() &&
                          emailKey.currentState!.validate() &&
                          nameFormKey.currentState!.validate() &&
                          surnameFormKey.currentState!.validate() &&
                          birthdayFormKey.currentState!.validate() &&
                          citizenshipFormKey.currentState!.validate() &&
                          numberPassportFormKey.currentState!.validate() &&
                          periodFormKey.currentState!.validate())) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaidPage()));
                      }
                    },
                    child: Text(
                        'Оплатить ${state.bookingModel.tourPrice! + state.bookingModel.fuelCharge! + state.bookingModel.serviceCharge!} Р',
                        style: AppTextTheme.chooseNumber),
                  ),
                ],
              ),
            ),
          );
        } else if (state is BookingErrorState) {
          return const Center(
            child: Text(
              'Error total price',
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

class RowTotalPriceWidget extends StatelessWidget {
  final String? info;
  final int? price;

  const RowTotalPriceWidget({
    super.key,
    required this.info,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          info!,
          style: AppTextTheme.priceForIt,
        ),
        Text(
          '$price Р',
          style: AppTextTheme.hotelDescription,
        ),
      ],
    );
  }
}
