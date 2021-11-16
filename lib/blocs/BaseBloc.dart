import 'dart:async';

class BaseBloc {
  StreamController _streamControllerToast = StreamController<String>();

  Stream<String> get showToastStream => _streamControllerToast.stream;

  StreamSink<String> get showToastSink => _streamControllerToast.sink;



  dispose() {
    _streamControllerToast.close();
  }
}
