import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/todo_model.dart';

class TodoVM extends ChangeNotifier {
  final List<TodoModel> _todoList = [];

  List<TodoModel> getTodoList() {
    return _todoList;
  }

  int getTodoCount() {
    return _todoList.length;
  }

  TodoModel getTodo(int position) {
    return _todoList[position];
  }

  void todoIsComplete(int position, bool isComplete) {
    var todoModel = getTodo(position);
    todoModel.isComplete = isComplete;
    _todoList[position] = todoModel;
    notifyListeners();
  }

  void addTodo(String titile, String message) {
    var todoModel = TodoModel(
        id: (getTodoCount() + 1),
        title: titile,
        message: message,
        isComplete: false);
    _todoList.add(todoModel);
    notifyListeners();
  }

  void deleteTodo(int position) {
    _todoList.removeAt(position);
    notifyListeners();
  }
}
