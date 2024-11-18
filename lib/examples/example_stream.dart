import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ExampleStream extends StatefulWidget {
  const ExampleStream({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExampleStreamState();
  }
}

class ExampleStreamState extends State<ExampleStream> {
  var streamController1 = StreamController<int>();
  var streamController2 = StreamController<int>();
  var counter = 0;
  var isStop = false;
  var isRunning = false;

  void start() async {
    if (isRunning) return;
    setState(() {
      isStop = false;
      isRunning = true;
    });
    while (true) {
      if (isStop) {
        setState(() {
          isRunning = false;
        });
        return;
      }
      streamController1.add(counter);
      for (var i in List.generate(10, (index) => index)) {
        await Future.delayed(const Duration(milliseconds: 100));
        streamController2.add(Random().nextInt(100));
      }
      counter = counter + 1;
    }
  }

  void stop() {
    setState(() {
      isStop = true;
    });
  }

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
            child: Row(
              children: [
                isRunning
                    ? IconButton(
                        onPressed: () {
                          stop();
                        },
                        icon: const Icon(Icons.pause))
                    : IconButton(
                        onPressed: () {
                          start();
                        },
                        icon: const Icon(Icons.play_arrow)),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
          Expanded(
            child: Stack(
              children: [
                const Placeholder(),
                StreamBuilder(
                  stream: streamController1.stream,
                  builder: (context, snapshot1) {
                    return StreamBuilder(
                      stream: streamController2.stream,
                      builder: (context, snapshot2) {
                        if (snapshot1.connectionState == ConnectionState.active &&
                            snapshot2.connectionState == ConnectionState.active) {
                          return Align(
                            alignment: Alignment.center,
                            child: Text('Stream1: ${snapshot1.data!}\nStream2: ${snapshot2.data!}'),
                          );
                        }
                        return const Align(
                          alignment: Alignment.center,
                          child: Text('stream is not active'),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
