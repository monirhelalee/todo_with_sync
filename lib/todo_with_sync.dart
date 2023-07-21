import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_sync/core/utils/providers_list.dart';
import 'package:todo_with_sync/root.dart';

class TodoWithSync extends StatelessWidget {
  const TodoWithSync({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Todo with sync',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        home: const Root(),
      ),
    );
  }
}
