import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name = "";
  setcounter() async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser?.uid);

    final snapshot = await ref.child("value").get();
    if (snapshot.exists) {
      setState(() {
        _counter = int.parse(snapshot.value!.toString());
        name = FirebaseAuth.instance.currentUser!.displayName.toString();
      });
    }
  }

  @override
  void initState() {
    setcounter();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser?.uid);
      ref.update({
        "value": ServerValue.increment(1),
      });
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Text(
              "Hi, $name",
              style: const TextStyle(fontSize: 24),
            ),
            const Spacer(),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
