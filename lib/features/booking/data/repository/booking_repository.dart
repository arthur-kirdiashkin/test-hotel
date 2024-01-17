import 'dart:convert';

import 'package:testovoe_hotel/features/booking/data/models/booking_model.dart';
import 'package:http/http.dart' as http;

abstract class BookingRepository {
  Future<BookingModel> getBooking();
}

class BookingRepo implements BookingRepository {
  @override
  Future<BookingModel> getBooking() async {
    final urlBooking = Uri.parse(
        'https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');
    final response = await http.get(urlBooking);

    if (response.statusCode == 200) {
      final bookingJson = json.decode(response.body);
      final responseModel = BookingModel.fromJson(bookingJson);
      return responseModel;
    } else
      throw Exception();
  }
}
