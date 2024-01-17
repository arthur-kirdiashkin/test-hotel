import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testovoe_hotel/features/hotel/data/models/hotel_model.dart';

abstract class HotelRepository {
  Future<HotelModel> getHotel();
}

class HotelRepo implements HotelRepository {
  

  HotelRepo();
  @override
  Future<HotelModel> getHotel() async {

      final urlHotel = Uri.parse('https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473');
      final response = await http.get(urlHotel);

      if(response.statusCode == 200) {
        final hotelJson = json.decode(response.body);
        final responseModel = HotelModel.fromJson(hotelJson);
        return responseModel;
        
      } else throw Exception();
      
    
  }

}