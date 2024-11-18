import 'package:flutter/material.dart';

class ExampleRowPercent extends StatefulWidget {
  const ExampleRowPercent({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExampleRowPercentState();
  }
}

class ExampleRowPercentState extends State<ExampleRowPercent> {
  var currentWidth = 50.0;

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
            child: Column(
              children: [
                Slider(
                  value: currentWidth,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {
                    setState(() {
                      currentWidth = value;
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
                Row(
                  children: [
                    Expanded(
                      flex: currentWidth.toInt(),
                      child: Container(),
                    ),
                    Expanded(
                      flex: 100 - currentWidth.toInt(),
                      child: Container(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${100 - currentWidth.toInt()}',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
