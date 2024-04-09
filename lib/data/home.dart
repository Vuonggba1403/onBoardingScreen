import 'package:flutter/material.dart';
import 'package:onboarding/onBoarding.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnBoarding(),
                ));
          },
          child: const Icon(Icons.close),
        ),
        title: const Text("Home"),
      ),
      body: Container(
        child: const Center(
            child: Text(
          "This is home",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        )),
      ),
    );
  }
}
