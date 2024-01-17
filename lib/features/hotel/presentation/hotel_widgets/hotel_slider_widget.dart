import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_bloc.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_state.dart';

class HotelSliderWidget extends StatefulWidget {
  const HotelSliderWidget({super.key});

  @override
  State<HotelSliderWidget> createState() => _HotelSliderWidgetState();
}

class _HotelSliderWidgetState extends State<HotelSliderWidget> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<HotelBloc, HotelState>(
      listener: (context, state) {
        if (state is HotelLoadState) {
          state.hotelModel;
        }
      },
      builder: (context, state) {
        if (state is HotelLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HotelLoadState) {
          return Column(
            children: [
              SizedBox(
                height: height * 0.073,
              ),
              const Center(
                child: Text('Отель', style: AppTextTheme.titleHotel),
              ),
              SizedBox(
                height: height * 0.024,
              ),
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: state.hotelModel.imageUrls!.length,
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
                        picture: index == 0
                            ? state.hotelModel.imageUrls![index]
                            : 'https://rus-traktor.ru/upload/iblock/f74/f74f39dbc9b60954c926d72401adf1cc.jpg',
                        width: MediaQuery.of(context).size.width * 0.92,
                      );
                    },
                  ),
                  Positioned(
                    top: 225,
                    left: 125,
                    child: Container(
                      margin: EdgeInsets.all(30),
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
                        dotsCount: state.hotelModel.imageUrls!.length,
                        position: _currentIndex.toDouble(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        } else if (state is HotelErrorState) {
          return const Center(
            child: Text(
              'Error slider',
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

class HotelSliderPictureWidget extends StatelessWidget {
  final String? picture;
  final double width;
  const HotelSliderPictureWidget(
      {super.key, required this.picture, required this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: picture ?? '',
        width: width,
      ),
    );
  }
}
