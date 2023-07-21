import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  static HomeViewModel read(BuildContext context) =>
      context.read<HomeViewModel>();

  static HomeViewModel watch(BuildContext context) =>
      context.watch<HomeViewModel>();
  bool _isLoading = false;

  set isLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
}
