import 'package:flutter/material.dart';

class ExampleRow extends StatefulWidget {
  const ExampleRow({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExampleRowState();
  }
}

class ExampleRowState extends State<ExampleRow> {
  var currentMainAxisAlignment = MainAxisAlignment.center;
  var currentHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            child: const Placeholder(),
          ),
          const SizedBox(height: 32.0),
          Expanded(
            child: Stack(
              children: [
                const Placeholder(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        color: Colors.amber[200],
                      ),
                      Container(
                        width: 100,
                        color: Colors.blue[200],
                      ),
                      Container(
                        width: 100,
                        color: Colors.deepOrange[200],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
