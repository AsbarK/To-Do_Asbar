import 'package:flutter/material.dart';
import 'todoinput.dart';

class TaskList extends StatefulWidget {
  final List<Todoinput> tsklist;
  final Function deleteTask;
  TaskList(this.deleteTask, this.tsklist);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        child: widget.tsklist.isEmpty
            ? const Text(
                "No Tasks Added Yet",
                style: TextStyle(fontSize: 1000, fontWeight: FontWeight.bold),
              )
            : ListView.builder(
                itemCount: widget.tsklist.length,
                itemBuilder: (context, index) {
                  if (index < widget.tsklist.length) {
                    return Card(
                      elevation: 8,
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                              color: Colors.black, Icons.brightness_1_outlined),
                          onPressed: () {
                            widget.deleteTask(widget.tsklist[index].id);
                            setState(() {});
                          },
                        ),
                        title: Text(widget.tsklist[index].title),
                      ),
                    );
                  } else {
                    return null;
                  }
                }));
  }
}
