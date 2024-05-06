import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as io;

class WatchlistService {

  final io.Socket socket = io.io(
    'https://data.progfusion.com',
    <String, dynamic>{
      'transports': ['websocket'],
      'force new connection': true,
      'query': {
        'timeStamp': new DateTime.now().millisecondsSinceEpoch,
      },
    },
  );

  final StreamController<Map<String, dynamic>> _streamController =
      StreamController<Map<String, dynamic>>();

  getData() {
    return _streamController;
  }

  void connectLiveData() {
    socket.on('liveData', (data) {
      _streamController.add(data);
      socket.disconnect();
      socket.connect();
    });
  }

  void startLiveData() {
    socket.connect();
    connectLiveData();
  }

  void stopLiveData() {
    socket.disconnect();
  }
}
