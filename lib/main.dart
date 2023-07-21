import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sync/features/auth/view_model/signin_view_model.dart';
import 'package:todo_with_sync/todo_with_sync.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => SignInViewModel(),
      child: const TodoWithSync(),
    ),
  );
}
