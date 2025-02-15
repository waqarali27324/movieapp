import 'package:get/get.dart';


class BaseController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value, {bool notify = true}) {
    if(_isLoading == value) return;
    _isLoading = value;
    if (notify) update();
  }
}

enum LoadingState {
  loading, // loading
  success, // data
  error, // error
  idle, // initial state
  empty, // no data
}