import 'package:flutter/material.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_widgets/basic_data_widget.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_widgets/choose_number_widget.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_widgets/detailed_data_widget.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_widgets/hotel_slider_widget.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )),
              child: const Column(children: [
                HotelSliderWidget(),
                SizedBox(
                  height: 16,
                ),
                BasicDataWidget(),
                SizedBox(
                  height: 16,
                ),
              ]),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: const DetailedDataWidget(),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )),
              child: const ChooseNumberWidget(),
            )
          ],
        ),
      ),
    );
  }
}
