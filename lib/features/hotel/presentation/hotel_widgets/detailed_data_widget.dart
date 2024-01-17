import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_bloc.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_state.dart';
import 'dart:ui';

class DetailedDataWidget extends StatelessWidget {
  const DetailedDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HotelLoadState) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Об Отеле', style: AppTextTheme.textHotel),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${state.hotelModel.aboutTheHotel!.peculiarities![0]}',
                          style: AppTextTheme.infoHotel),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Text(
                              '${state.hotelModel.aboutTheHotel!.peculiarities![1]}',
                              style: AppTextTheme.infoHotel),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                              '${state.hotelModel.aboutTheHotel!.peculiarities![3]}',
                              style: AppTextTheme.infoHotel),
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                          '${state.hotelModel.aboutTheHotel!.peculiarities![2]}',
                          style: AppTextTheme.infoHotel),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  '${state.hotelModel.aboutTheHotel!.description}',
                  style: AppTextTheme.hotelDescription
                ),
                const SizedBox(
                  height: 31,
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      CardIcon(
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Удобства',
                                style: AppTextTheme.titleCardIcon
                              ),
                              Text(
                                'Самое необходимое',
                                style: AppTextTheme.subTitleCardIcon
                              )
                            ],
                          ),
                          iconLeading:
                              SvgPicture.asset('assets/emoji-happy.svg'),
                          iconTrailing:
                              SvgPicture.asset('assets/vector-55.svg')),
                      const Padding(
                        padding: EdgeInsets.only(left: 72, right: 23),
                        child: Divider(
                          height: 1,
                          color: Color.fromRGBO(130, 135, 150, 0.15),
                        ),
                      ),
                      CardIcon(
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Что включено',
                                style: AppTextTheme.titleCardIcon
                              ),
                              Text(
                                'Самое необходимое',
                                style: AppTextTheme.subTitleCardIcon
                              )
                            ],
                          ),
                          iconLeading:
                              SvgPicture.asset('assets/tick-square.svg'),
                          iconTrailing:
                              SvgPicture.asset('assets/vector-55.svg')),
                      const Padding(
                        padding: EdgeInsets.only(left: 72, right: 23),
                        child: Divider(
                          height: 1,
                          color: Color.fromRGBO(130, 135, 150, 0.15),
                        ),
                      ),
                      CardIcon(
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Что не включено',
                                style: AppTextTheme.titleCardIcon
                              ),
                              Text(
                                'Самое необходимое',
                                style: AppTextTheme.subTitleCardIcon
                              )
                            ],
                          ),
                          iconLeading:
                              SvgPicture.asset('assets/close-square.svg'),
                          iconTrailing:
                              SvgPicture.asset('assets/vector-55.svg')),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is HotelErrorState) {
          return const Center(
            child: Text(
              'Error detailed data',
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

class CardIcon extends StatelessWidget {
  final Widget? title;
  final SvgPicture? iconLeading;
  final SvgPicture? iconTrailing;
  const CardIcon({
    super.key,
    required this.title,
    required this.iconLeading,
    required this.iconTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        title: title,
        leading: iconLeading,
        trailing: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: iconTrailing,
        ),
      ),
    );
  }
}
