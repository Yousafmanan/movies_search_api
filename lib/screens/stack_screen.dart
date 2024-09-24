import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          'Stack Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            // Container(
            //   height: 400,
            //   width: 400,
            //   decoration: BoxDecoration(
            //     color: Colors.green
            //   ),
            // ),
            // Positioned(
            //   left: 30,
            //   right: 30,
            //   bottom: 20,
            //   top: 20,
            //   child: Container(
            //     height: 300,
            //     width: 300,
            //     decoration: BoxDecoration(
            //       color: Colors.white
            //     ),
            //   ),
            // ),
            // Positioned(
            //   left: 50,
            //   right: 50,
            //   top: 60,
            //   bottom: 60,
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     decoration: BoxDecoration(
            //       color: Colors.black
            //     ),
            //   ),
            // ),
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/profile.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
                top: 500,
                left: 80,
                right: 80,
                bottom: 20,
                child: Text(
                  'YOUSAF MANAN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
             const Positioned(
                left: 90,
                right: 90,
                top: 550,
                child: Text(
                  'OMER MANAN',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
          ],
        ),
      ),
    );
  }
}
