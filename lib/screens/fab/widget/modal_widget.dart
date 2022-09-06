// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ModalWidget extends StatelessWidget {
  ModalWidget({this.title, required this.child});

  final Widget? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color:theme.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 3,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: theme.splashColor
            )
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 18,
              bottom: 8,
            ),
            child: title,
            // child: Text(
            //   title ?? '',
            //   style: theme.textTheme.subtitle2!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
          ),
          child
        ],
      ),
    ); 
  }
}