import 'package:flutter/material.dart';
import 'package:onboarding/data/contensplash.dart';
import 'package:onboarding/data/home.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = PageController(initialPage: 0); // Move initialization here

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
        itemCount: contents.length,
        controller: _controller, // Set controller here
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return Container(
            color: contents[i].colors,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    contents[i].text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Bungee Spice",
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 40),
                  //image
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      contents[i].image,
                      width: 350,
                      height: 350,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (index) => buildDot(index),
                      ),
                    ),
                  ),

                  //button
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        if (currentIndex == contents.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.bounceIn,
                          );
                        }
                      },
                      child: Text(currentIndex == contents.length - 1
                          ? "Continue"
                          : "Next"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(right: 5),
    );
  }
}
