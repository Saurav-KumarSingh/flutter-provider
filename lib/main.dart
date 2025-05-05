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
        child: const HomePage(),
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
        body: SafeArea(
          child: Center(
            child: Consumer<CounterProvider>(
              builder: (ctx,_,__){

                return Text(
                  // '${Provider.of<CounterProvider>(ctx,listen: true).getCount()}',
                  '${ctx.watch<CounterProvider>().getCount()}',
                  style: const TextStyle(fontSize: 25),
                );
              },
            )
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // Provider.of<CounterProvider>(context,listen: false).incrementCount(); //old way (need to pass listen false else error)

                    context.read<CounterProvider>().incrementCount();

                  },
                  child: const Text('Add',style: TextStyle(color: Colors.white)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Provider.of<CounterProvider>(context,listen: false).decrementCount();
                    context.read<CounterProvider>().decrementCount();


                  },
                  child: const Text('Sub',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent),),
              ),
            ],
          ),
        ));
  }
}
