import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/features/booking/data/repository/booking_repository.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_bloc.dart';
import 'package:testovoe_hotel/features/hotel/data/repository/hotel_repository.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_bloc.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_event.dart';
import 'package:testovoe_hotel/features/hotel/presentation/page/hotel_page.dart';
import 'package:testovoe_hotel/features/number/data/repository/room_repository.dart';
import 'package:testovoe_hotel/features/number/presentation/room_bloc/room_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => HotelRepo()),
        RepositoryProvider(create: (context) => RoomRepo()),
        RepositoryProvider(create: (context) => BookingRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HotelBloc>(
              create: (context) =>
                  HotelBloc(context.read<HotelRepo>())..add(HotelLoadEvent())),
          BlocProvider<RoomBloc>(
              create: (context) => RoomBloc(context.read<RoomRepo>())),
          BlocProvider(
              create: (context) => BookingBloc(context.read<BookingRepo>())),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(246, 246, 249, 1),
        ),
        home: HotelPage());
  }
}
