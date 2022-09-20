import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(this.title, {Key? key}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Positioned(
      top: 60,
      left: 20,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(title, style: theme.textTheme.headline1),
        )
      ),
    );
  }
}