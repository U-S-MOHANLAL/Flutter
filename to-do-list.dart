import "package:flutter/material.dart";

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatefulWidget {
  @override
  _ToDoApp createState() => _ToDoApp();
}

class _ToDoApp extends State<ToDoApp> {
  List<Map<String, dynamic>> workItem = [];
  String input = "";

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    "To DO List App",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: workItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: index % 2 == 0
                      ? Color.fromARGB(100, 222, 255, 233)
                      : Color.fromARGB(100, 255, 247, 214),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: workItem[index]["isChecked"],
                            checkColor: Colors.white,
                            fillColor: WidgetStateProperty.resolveWith<Color>((
                              Set<WidgetState> states,
                            ) {
                              if (states.contains(WidgetState.selected)) {
                                return Colors
                                    .black; // Color when the checkbox is checked
                              }
                              return Colors
                                  .transparent; // Color when the checkbox is unchecked
                            }),
                            onChanged: (value) {
                              setState(() {
                                workItem[index]["isChecked"] = value;
                              });
                            },
                          ),
                          Expanded(
                            child: Center(
                              child: Text(workItem[index]["itemName"], style: TextStyle(color: workItem[index]["isChecked"]? Colors.grey : Colors.black, decoration: workItem[index]["isChecked"] ? TextDecoration.lineThrough : TextDecoration.none)),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () => {
                              setState(() {
                                workItem.removeAt(index);
                              }),
                            },
                            child: Icon(Icons.delete, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
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
                            if (input != ""){
                              setState(() {
                                workItem.insert(0, {
                                  "itemName": input,
                                  "isChecked": false,
                                });
                                input = "";
                              }),
                              Navigator.of(context).pop(),
                            }
                          },
                          child: Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.add, color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}
