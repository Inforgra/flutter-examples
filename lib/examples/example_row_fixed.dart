import 'package:flutter/material.dart';

class ExampleRowFixed extends StatefulWidget {
  const ExampleRowFixed({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExampleRowFixedState();
  }
}

class ExampleRowFixedState extends State<ExampleRowFixed> {
  var boxHeight = 30.0;
  var boxWdith = 240.0;
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
          SizedBox(
            height: boxHeight * 20,
            child: Stack(
              children: [
                const Placeholder(),
                Column(
                  children: [
                    for (var i in List.generate(20, (int index) => index))
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: boxHeight,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                                  top: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                                ),
                              ),
                              child: Text('col$i row1'),
                            ),
                          ),
                          Container(
                            width: boxWdith,
                            height: boxHeight,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                                top: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                                right: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                              ),
                            ),
                            child: Text('col$i row1'),
                          ),
                          Expanded(
                            child: Container(
                              height: boxHeight,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                                  top: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.outline),
                                ),
                              ),
                              child: Text('col$i row1'),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: boxHeight * 10,
                          color: Colors.blue[200],
                        ),
                      ),
                    ),
                    SizedBox(width: boxWdith),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: boxHeight * 10,
                          color: Colors.blue[200],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
