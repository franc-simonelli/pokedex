// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Center(
         child: Container(
          width: 100,
          height: 100,
          child: Image.asset('contents/images/pika_loader.gif', )
        ),
      ),
    );
  }
}