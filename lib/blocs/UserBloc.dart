import 'dart:async';

import 'package:login/blocs/BaseBloc.dart';
import 'package:login/utility/Utils.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BaseBloc {
  final _userEmail = BehaviorSubject<String>();
  final _userPass = BehaviorSubject<String>();
  final isLoading = BehaviorSubject<bool>();

  //GET
  Stream<String> get userEmail => _userEmail.stream.transform(validateEmail);

  Stream<String> get userPass => _userPass.stream.transform(validatePass);

  Stream<bool> get userValid =>
      Rx.combineLatest2(userEmail, userPass, (a, b) => true);

  //SET
  Function(String) get changeUserEmail => _userEmail.sink.add;

  Function(String) get changeUserPass => _userPass.sink.add;

  dispose() {
    super.dispose();
    _userEmail.close();
    _userPass.close();
    isLoading.close();
  }

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (userEmail, sink) {
    if (!Utils.isValidEmail(userEmail)) {
      sink.addError("Please enter a valid E-mail address.");
    } else {
      sink.add(userEmail);
    }
  });

  final validatePass = StreamTransformer<String, String>.fromHandlers(
      handleData: (userPass, sink) {
    if (!Utils.isValidPass(userPass)) {
      sink.addError(
          "A Password must contain one Uppercase, Lowercase, number, Special Character and length of 8.");
    } else {
      sink.add(userPass);
    }
  });

  loginUser() {
    print("User Logged in with Email: ${_userEmail.value}");
    showToastSink.add("User Logged in with Email: ${_userEmail.value}");

    /*isLoading.sink.add(true);

    Future.delayed(const Duration(seconds: 3), () {
      isLoading.sink.add(true);
      print("User Logged in with Email: ${_userEmail.value}");
      showToast.sink.add("User Logged in with Email: ${_userEmail.value}");
    });*/
  }
}
