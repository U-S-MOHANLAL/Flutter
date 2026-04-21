import "package:flutter/material.dart";

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatefulWidget {
  @override
  _ToDoApp createState() => _ToDoApp();
}

class _ToDoApp extends State<ToDoApp> {
  List workItem = [];
  String input = "";
  void addWorkItem() {
    setState(() {
      workItem.insert(0, "A");
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "To DO List App",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: workItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(workItem[index]),
                      height: 40,
                      width: 500,
                      color: index % 2 == 0
                          ? Colors.red
                          : Colors.lightBlueAccent,
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        setState(() {
                          workItem.removeAt(index);
                        }),
                      },
                      child: Icon(Icons.delete),
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Add To DO"),
                      actions: [
                        TextField(
                          onChanged: (value) => {
                            setState(() {
                              input = value;
                            }),
                          },
                        ),
                        TextButton(
                          onPressed: () => {
                            setState(() {
                              workItem.insert(0, input);
                            }),
                            Navigator.of(context).pop(),
                          },
                          child: Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
