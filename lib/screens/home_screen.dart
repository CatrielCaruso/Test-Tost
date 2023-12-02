import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset('assets/img/home_top.png'),
            ),
            Positioned(
              right: 0,
              top: MediaQuery.of(context).size.height * 0.22,
              child: Image.asset('assets/img/home_center.png'),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/img/home_bottom_right.png'),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/img/home_bottom_left.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 34,
                    ),
                    Image.asset('assets/img/minimal_text.png'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Image.asset('assets/img/client_text.png')],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
