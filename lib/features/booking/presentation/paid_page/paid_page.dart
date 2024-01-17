import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/hotel/presentation/page/hotel_page.dart';

class PaidPage extends StatelessWidget {
  const PaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration:
            const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Column(
          children: [
            const SizedBox(
              height: 65,
            ),
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
                    'Заказ оплачен',
                    style: AppTextTheme.titleHotel,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 223,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 94,
                    height: 94,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(246, 246, 249, 1),
                        borderRadius: BorderRadius.circular(1000)),
                    child: Image.asset('assets/Party Popper.png'),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Ваш заказ принят в работу',
                    style: AppTextTheme.roomName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Center(
                      child: Text(
                        'Подтверждение заказа №${Random().nextInt(105000)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                        style: AppTextTheme.priceForIt,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          backgroundColor:
                              const Color.fromRGBO(13, 114, 255, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HotelPage()));
                      },
                      child: const Text('Супер!',
                          style: AppTextTheme.chooseNumber),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
