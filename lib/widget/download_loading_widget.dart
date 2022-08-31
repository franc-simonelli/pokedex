// ignore_for_file: sized_box_for_whitespace

import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pokedex/provider/modal_provider.dart';
import 'package:pokedex/widget/progress_bar_widget.dart';
import 'package:provider/provider.dart';

import '../provider/progress_bar_provider.dart';


class DonwloadLoadingWidget extends StatefulWidget {
  const DonwloadLoadingWidget({Key? key}) : super(key: key);

  @override
  State<DonwloadLoadingWidget> createState() => _DonwloadLoadingWidgetState();
}

class _DonwloadLoadingWidgetState extends State<DonwloadLoadingWidget> {
  double pikachuMove = 0;
  late Timer timer;
  String position = 'avanti';

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) => setState(() {

      if(pikachuMove == 280) {
        position = 'indietro';
      }
      if(pikachuMove == 30) {
        position = 'avanti';
      }
      if(position == 'avanti') {
        pikachuMove = pikachuMove + 10;

      }
      if(position == 'indietro') {
        pikachuMove = pikachuMove - 10;
      }
      
    }));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   Image image = Image.asset('contents/images/pika_loader.gif', width: 40,);

    var theme = Theme.of(context);
    return Consumer<ProgressBarProvider>(builder: (ctx, provider, _) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: const AssetImage("contents/images/pokedex.jpg"), fit: BoxFit.cover,),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text("Download in corso . . . ", style: theme.textTheme.subtitle2!.copyWith(color: Colors.grey.shade900)),
              const SizedBox(height: 5,),
              ProgressBar(width: 300, height: 30, progress: provider.progress, child: buildChild(image, provider.progress, 300),)
            ],
          ),
        ),
      );
    });
  }

  Widget buildChild(Image image, progress, width) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      left: progress,
      top: 0,
      child: image,
      // child: position == 'avanti'? 
      // image 
      // : 
      // Transform(
      //   transform: Matrix4.rotationY(math.pi),
      //   child: image,
      // ),
    );
  }

  calculatePercent(progress, width) {
    var n = ((100 * progress) / width);
    var x = num.parse(n.toStringAsFixed(2));
    return x.toDouble();
  }
}