import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInViewModel extends ChangeNotifier {
  static SignInViewModel read(BuildContext context) =>
      context.read<SignInViewModel>();

  static SignInViewModel watch(BuildContext context) =>
      context.watch<SignInViewModel>();
  String? accessToken;
  bool _isLoggedIn = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FocusNode passwordFocus = FocusNode();
  bool _isLoading = false;

  set isLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  Future<void> onLogin() async {}

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    log('AccessTokenFromGet: $accessToken');
    if (accessToken == '' || accessToken == null) {
      _isLoggedIn = false;
    } else {
      _isLoggedIn = true;
    }
    this.accessToken = accessToken;
    notifyListeners();
    return accessToken;
  }

  Future<void> setToken(String accessToken) async {
    log('accessTokenSet $accessToken');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    this.accessToken = accessToken;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
}

class AuthViewWrapper extends StatefulWidget {
  final Widget child;

  const AuthViewWrapper({Key? key, required this.child}) : super(key: key);

  @override
  AuthViewWrapperState createState() => AuthViewWrapperState();
}

class AuthViewWrapperState extends State<AuthViewWrapper> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignInViewModel>(
      builder: (context, vm, _child) =>
          SizedBox(key: Key(vm.accessToken ?? ''), child: widget.child),
    );
  }
}
