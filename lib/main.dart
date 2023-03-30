import 'package:flutter/material.dart';
import 'package:todo/newtask.dart';
import 'package:todo/taskslist.dart';
import 'package:todo/todoinput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO-DO',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'TO-DO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todoinput> tlist = [];
  // final taskListKey = GlobalKey<TaskListState>();

  void _deletetsk(String id) {
    setState(() {
      tlist.removeWhere((element) => element.id == id);
      // taskListKey.currentState?.updateList(tlist);
    });
  }

  void _addtsk(String titletsk, DateTime chosendate) {
    final newtsk = Todoinput(
      DateTime.now().toString(),
      titletsk,
      chosendate,
    );
    setState(() {
      tlist.add(newtsk);
    });
  }

  void _starttsk(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTask(_addtsk),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            tlist.isEmpty
                ? const Text("No Tasks Added yet")
                : TaskList(
                    // key: taskListKey,
                    _deletetsk,
                    tlist,
                  )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _starttsk(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
