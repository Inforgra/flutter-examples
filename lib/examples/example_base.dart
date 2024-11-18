import 'package:flutter/material.dart';

class ExampleBase extends StatefulWidget {
  const ExampleBase({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExampleBaseState();
  }
}

class ExampleBaseState extends State<ExampleBase> {
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
          const Expanded(
            child: Stack(
              children: [
                Placeholder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
