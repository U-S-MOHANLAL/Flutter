import "package:flutter/material.dart";

void main() {
  runApp(SmartCounter());
}

class SmartCounter extends StatefulWidget {
  @override
  _SmartCounter createState() => _SmartCounter();
}

class _SmartCounter extends State<SmartCounter> {
  @override
  int counter = 0;
  Object color = Colors.black;

  getColor() {
    if (counter == 0) {
      return Colors.black;
    }
    return counter < 0 ? Colors.red : Colors.green;
  }

  void operate(String operation) {
    if (operation == "inc") {
      setState(() {
        counter++;
      });
    } else if (operation == "dec") {
      setState(() {
        counter--;
      });
    } else {
      setState(() {
        counter = 0;
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Smart Counter")),
        body: Row(
          children: [
            Text(
              "$counter",
              style: TextStyle(
                color: getColor(),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () => operate("inc"),
              child: Text("Increment"),
            ),
            ElevatedButton(
              onPressed: () => operate("res"),
              child: Text("Reset"),
            ),
            ElevatedButton(
              onPressed: () => operate("dec"),
              child: Text("Decrement"),
            ),
          ],
        ),
      ),
    );
  }
}
