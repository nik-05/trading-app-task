import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as io;

class WatchlistService {

  WatchlistService() {
    _initializeEvents();
  }

  _initializeEvents() {
    _connectLiveData();
  }

  final io.Socket socket = io.io('https://data.progfusion.com', <String, dynamic>{
  'transports': ['websocket'],
  });

  final StreamController<Map<String, dynamic>> _streamController = StreamController<Map<String, dynamic>>();

  getData() {
    return _streamController;
  }

  void _connectLiveData() {
    socket.on('liveData', (data) {
      _streamController.add(data);
    });
  }

  void startLiveData() {
    socket.emit('liveData');
  }

  void stopLiveData() {
    socket.disconnect();
  }

}