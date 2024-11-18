import 'package:flutter/material.dart';

class ExampleColumn extends StatefulWidget {
  const ExampleColumn({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExampleColumnState();
  }
}

class ExampleColumnState extends State<ExampleColumn> {
  var currentMainAxisAlignment = MainAxisAlignment.center;
  var currentHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DropdownButton<MainAxisAlignment>(
                  value: currentMainAxisAlignment,
                  items: MainAxisAlignment.values
                      .map(
                        (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e
                                .toString()
                                .replaceAll('MainAxisAlignment.', ''))),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      currentMainAxisAlignment = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
          Expanded(
            child: Stack(
              children: [
                const Placeholder(),
                Column(
                  mainAxisAlignment: currentMainAxisAlignment,
                  children: [
                    Container(
                      height: currentHeight,
                      color: Colors.amber[200],
                    ),
                    Container(
                      height: currentHeight,
                      color: Colors.blue[200],
                    ),
                    Container(
                      height: currentHeight,
                      color: Colors.deepOrange[200],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
