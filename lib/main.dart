import 'package:flutter/material.dart';
import 'package:flutter_basic/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: Text(
            '${context.watch<CounterProvider>().getCount()}',
            style: const TextStyle(fontSize: 25),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().incrementCount();
                },
                child: const Text('Add')),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().decrementCount();
                },
                child: const Text('Sub')),
          ],
        ));
  }
}
