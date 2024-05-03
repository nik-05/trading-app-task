// Events
import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/modules/home/services/watchlist_service.dart';

abstract class LiveDataEvent {
  const LiveDataEvent();
}
class LiveDataConnected extends LiveDataEvent {}
class LiveDataDisconnected extends LiveDataEvent {}

// States
abstract class LiveDataState {
  const LiveDataState();
}
class LiveDataInitial extends LiveDataState {}
class LiveDataConnectedState extends LiveDataState {}
class LiveDataDisconnectedState extends LiveDataState {}

class LiveDataReceivedState extends LiveDataState {
  final StreamController<Map<String, dynamic>> data;
  const LiveDataReceivedState(this.data);
}

class LiveDataBloc extends Bloc<LiveDataEvent, LiveDataState> {
  LiveDataBloc() : super(LiveDataInitial()) {
    on<LiveDataConnected>((event, emit) {
      try {
        final service = WatchlistService();
        service.startLiveData();
        
        emit(LiveDataReceivedState(
          service.getData(),
        ));
      } catch (e) {
        log(e.toString());
        emit(LiveDataDisconnectedState());
      }
    });

    on<LiveDataDisconnected>((event, emit) {
      emit(LiveDataDisconnectedState());
    });

  }
}