import 'package:easy_gap/easy_gap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = [Colors.red, Colors.green, Colors.blue];
    const length = 10;
    return MaterialApp(
        title: 'Easy Gap Demo',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Easy Gap Demo'),
            ),
            body: SafeArea(
                child: CustomScrollView(
                    slivers: [
              ...List.generate(
                  length,
                  (index) => SliverToBoxAdapter(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...colors.map((e) => Container(
                                  height: 50,
                                  width: 20,
                                  color: e.withOpacity(
                                      1 - (1 / (length + 1)) * (index + 1)),
                                ))
                          ].gap(
                              50) // Adds an empty spaces of 50 pixels between widgets.
                          )))
            ].sliverGap(20) // Adds an empty spaces of 20 pixels between slivers.
                    ))));
  }
}
