import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_bloc.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_event.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_page/booking_page.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_widgets/hotel_slider_widget.dart';

class OneRoomWidget extends StatefulWidget {
  final int? id;
  final String? name;
  final int? price;
  final String? pricePer;
  final List<String>? peculiarities;
  final List<String>? imageUrls;

  const OneRoomWidget(
      {super.key,
      required this.id,
      required this.name,
      required this.price,
      required this.pricePer,
      required this.peculiarities,
      required this.imageUrls});

  @override
  State<OneRoomWidget> createState() => _OneRoomWidgetState();
}

class _OneRoomWidgetState extends State<OneRoomWidget> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: widget.imageUrls!.length,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.316,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, _) {
                    return HotelSliderPictureWidget(
                      width: MediaQuery.of(context).size.width * 0.92,
                      picture: index == 1
                          ? 'https://rus-traktor.ru/upload/iblock/f74/f74f39dbc9b60954c926d72401adf1cc.jpg'
                          : widget.imageUrls![index],
                    );
                  },
                ),
                Positioned(
                  top: 225,
                  left: 125,
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    width: 60,
                    height: 17,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DotsIndicator(
                      decorator: const DotsDecorator(
                        size: Size(7, 7),
                        activeSize: Size(7, 7),
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.22),
                          Color.fromRGBO(0, 0, 0, 0.17),
                          Color.fromRGBO(0, 0, 0, 0.1),
                        ],
                        activeColor: Colors.black,
                        spacing: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      dotsCount: widget.imageUrls!.length,
                      position: _currentIndex.toDouble(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name!, style: AppTextTheme.roomName),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.peculiarities![0],
                        style: AppTextTheme.roomPeculiarities,
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                      Text(
                        widget.peculiarities![1],
                        style: AppTextTheme.roomPeculiarities,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(13, 114, 255, 0.1),
                        borderRadius: BorderRadius.circular(5)),
                    height: 29,
                    width: 192,
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Подробнее об отеле',
                          style: TextStyle(
                              fontFamily: 'SFProDisplayRegular',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(13, 114, 255, 1)),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromRGBO(13, 114, 255, 1),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text('${widget.price} р', style: AppTextTheme.minimalPrice),
                    const SizedBox(
                      width: 8,
                    ),
                    Text('${widget.pricePer}', style: AppTextTheme.priceForIt)
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BookingBloc>().add(BookingLoadEvent());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookingPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: const Color.fromRGBO(13, 114, 255, 1),
                        minimumSize: const Size(double.infinity, 48)),
                    child:
                        const Text('Выбрать номер', style: AppTextTheme.chooseNumber),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
