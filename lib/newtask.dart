import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTask extends StatefulWidget {
  final Function addTask;
  NewTask(this.addTask);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  DateTime? _selectdate;

  void _submitdata() {
    final enteredtask = _titleController.text;
    if (_titleController.text.isEmpty) {
      return;
    } else {
      if (_selectdate == null) {
        return;
      }
      widget.addTask(enteredtask, _selectdate);
      Navigator.of(context).pop();
    }
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    ).then((presentdate) {
      if (presentdate == null) {
        return;
      }
      setState(() {
        _selectdate = presentdate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Enter the task"),
              controller: _titleController,
              onSubmitted: (_) => _submitdata(),
            ),
            Container(
              height: 85,
              child: Row(
                children: [
                  Expanded(
                      child: Text(_selectdate == null
                          ? 'No Date Choosen'
                          : 'Picked Date ${DateFormat.yMd().format(_selectdate!)}')),
                  TextButton(
                      onPressed: _datePicker, child: const Text("Choose Date")),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: _submitdata,
                style: ButtonStyle(elevation: MaterialStateProperty.all(2)),
                child: const Text("Add Task To TO-DO ")),
          ],
        ),
      ),
    );
  }
}
