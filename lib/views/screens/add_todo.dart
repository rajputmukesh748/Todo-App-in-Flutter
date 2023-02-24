import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/view_models/todo_vm.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Today Task',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: messageController,
              maxLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(label: Text('Message')),
            ),
            const SizedBox(height: 15),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (titleController.text.trim().isEmpty) {
                        showSnackbar(context, 'Please enter title.');
                      } else if (messageController.text.trim().isEmpty) {
                        showSnackbar(context, 'Please enter message');
                      } else {
                        Provider.of<TodoVM>(context, listen: false).addTodo(
                            titleController.text, messageController.text);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Save')))
          ],
        ),
      )),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    var snackbar = SnackBar(
        backgroundColor: Colors.blue,
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
