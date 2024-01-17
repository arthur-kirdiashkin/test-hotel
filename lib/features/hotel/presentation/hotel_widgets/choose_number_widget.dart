import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/common/themes/app_text_theme.dart';
import 'package:testovoe_hotel/features/number/presentation/page/room_page.dart';
import 'package:testovoe_hotel/features/number/presentation/room_bloc/room_bloc.dart';
import 'package:testovoe_hotel/features/number/presentation/room_bloc/room_event.dart';

class ChooseNumberWidget extends StatelessWidget {
  const ChooseNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: const Color.fromRGBO(13, 114, 255, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          context.read<RoomBloc>().add(RoomLoadEvent());
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const RoomPage()));
        },
        child: const Text('К выбору номера', style: AppTextTheme.chooseNumber),
      ),
    );
  }
}
