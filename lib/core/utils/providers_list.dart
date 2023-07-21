import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_with_sync/features/home/view_model/home_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(),
  ),
];
