import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_taskdb/db/DB_admin.dart';
import 'package:flutter_codigo_taskdb/models/task_model.dart';
import 'package:flutter_codigo_taskdb/widgets/my_form_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
 

class _HomePageState extends State<HomePage> {
  Future<String> getFullName() async {
    return "Juan Manuel";
  }

  showDialogForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyformWidget();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    DBAdmin.db.getTasks();

    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogForm();
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: DBAdmin.db.getTasks(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.data) {
            List<TaskModel> myTasks = snap.data;
            return ListView.builder(
              itemCount: myTasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(myTasks[index].title),
                  subtitle: Text(myTasks[index].description),
                  trailing: Text(myTasks[index].id.toString()),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
