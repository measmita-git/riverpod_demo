import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

final counterProvider = StateProvider((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Text('Value : $value'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).state++,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).state--,
            child: Icon(CupertinoIcons.minus),
          ),
        ],
      ),
    );
  }
}
