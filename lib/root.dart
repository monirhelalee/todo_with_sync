import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sync/features/auth/view/signin_page.dart';
import 'package:todo_with_sync/features/auth/view_model/signin_view_model.dart';
import 'package:todo_with_sync/features/home/view/home_page.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    final token = Provider.of<SignInViewModel>(context, listen: false);
    final navigator = Navigator.of(context);

    Future.delayed(Duration.zero, () async {
      await token.getToken();

      if (token.accessToken == null || token.accessToken == '') {
        await navigator.pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const SignInPage(),
          ),
        );
      } else {
        await navigator.pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomePage(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
