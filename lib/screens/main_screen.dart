import 'package:flutter/material.dart';
import 'package:flutter_examples/examples/example_base.dart';
import 'package:flutter_examples/examples/example_column.dart';
import 'package:flutter_examples/examples/example_row.dart';
import 'package:flutter_examples/examples/example_row_percent.dart';
import 'package:flutter_examples/widgets/theme_button.dart';

class MainScreen extends StatefulWidget {
  final String appTitle;
  const MainScreen({super.key, required this.appTitle});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {

  static const examples = {
    "Base": ExampleBase(),
    "Column": ExampleColumn(),
    "Row": ExampleRow(),
    "Row Percent": ExampleRowPercent(),
  };

  var currentExample = "Column";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.appTitle} - $currentExample'),
        actions: const [
          ThemeButton(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: examples.entries.map((e) => 
            ListTile(
              title: Text(e.key),
              onTap: () {
                setState(() {
                  currentExample = e.key;
                });
                Navigator.pop(context);
              },
            ),
          ).toList(),
        ),
      ),
      body: examples[currentExample],
    );
  }
}
