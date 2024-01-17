import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_bloc.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_event.dart';


class AddTouristWidget extends StatelessWidget {
  const AddTouristWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        title: const Text(
          'Добавить туриста',
          style: AppTextTheme.textHotel,
        ),
        trailing: GestureDetector(
          onTap: () {
            context.read<BookingBloc>().add(BookingLoadTouristEvent());
          },
          child: SvgPicture.asset('assets/add-icons.svg'),
        ),
      ),
    );
  }
}
