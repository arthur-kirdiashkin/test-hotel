import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/add_tourist_widget.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/info_booking_widget.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/info_customer_widget.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/info_hotel_widget.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/info_tourist_widget.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/total_price_widget.dart';


class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

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
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
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
                          width: 110,
                        ),
                        const Text(
                          'Бронирование',
                          style: AppTextTheme.titleHotel,
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(255, 255, 255, 1)),
              child: const InfoHotelWidget(),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              child: const InfoBookingWidget(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              child: const InfoCustomerWidget(),
            ),
            // ExpansionPanelListExample()
            const SizedBox(
              height: 8,
            ),
            const InfoTouristWidget(),
            const SizedBox(
              height: 8,
            ),
            const AddTouristWidget(),
            const SizedBox(
              height: 8,
            ),
            const TotalPriceWidget(),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
