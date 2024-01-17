import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_bloc.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_state.dart';

class InfoTouristWidget extends StatelessWidget {
  const InfoTouristWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is BookingLoadState) {}
      },
      builder: (context, state) {
        if (state is BookingLoadState) {
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: state.tourists.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: state.tourists[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 8,
                  color: Color.fromRGBO(246, 246, 249, 1),
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
