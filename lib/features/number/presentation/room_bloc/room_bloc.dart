import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/features/number/data/repository/room_repository.dart';
import 'package:testovoe_hotel/features/number/presentation/room_bloc/room_event.dart';
import 'package:testovoe_hotel/features/number/presentation/room_bloc/room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomRepository roomRepository;
  RoomBloc(this.roomRepository) : super(RoomLoadingState()) {
    on<RoomLoadEvent>(_loadNumber);
  }

  _loadNumber(RoomLoadEvent event, emit) async {
    try {
      final response = await roomRepository.getRooms();
      emit(RoomLoadState(roomsmodel: response));
    } catch (e) {
      emit(RoomErrorState(message: e.toString()));
    }
  }
}
