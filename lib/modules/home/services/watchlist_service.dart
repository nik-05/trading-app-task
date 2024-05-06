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


  Map<String, dynamic> arr = {};
  void connectLiveData() {
    socket.on('liveData', (data) {
      arr = data;
      _streamController.add(arr);
    });
    socket.on('message', (data) {
      arr[data["n"]] = data["p"];
      _streamController.add(arr);
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
