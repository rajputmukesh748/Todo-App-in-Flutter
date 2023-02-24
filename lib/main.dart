import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/view_models/todo_vm.dart';

import 'views/screens/todo_list.dart';

void main() {
  runApp(const AppController());
}

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoVM>(
        create: (BuildContext context) => TodoVM(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TodoList(),
        ));
  }
}
