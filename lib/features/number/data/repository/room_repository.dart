import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testovoe_hotel/features/number/data/models/rooms_model.dart';
abstract class RoomRepository {
  Future<Roomsmodel> getRooms();
}

class RoomRepo implements RoomRepository {
  @override
  Future<Roomsmodel> getRooms() async {
    
    final urlRoom = Uri.parse(
        'https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195');
    final response = await http.get(urlRoom);

    if (response.statusCode == 200) {
      final roomJson = json.decode(response.body);
      final responseModel = Roomsmodel.fromJson(roomJson);
      return responseModel;
    } else
      throw Exception();
  }
}
