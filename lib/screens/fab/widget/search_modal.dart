// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/provider/modal_provider.dart';
import 'package:provider/provider.dart';
import '../../../widget/search_bar_widget.dart';
import '../../home/widget/checkbox_widget.dart';
import 'modal_widget.dart';

class SearchBottomModal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ModalWidget(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: buildChild(context),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {Provider.of<ModalProvider>(context, listen: false).setCheckSearch(context);},
          child: Row(
            children: [
              Consumer<ModalProvider>(builder: (ctx, provider, _) {
                return CheckBoxWidget(provider.checkSearch);
              }),
              SizedBox(width: 10,),
              Text("Search in all generations")
            ]
          ),
        ),
        SizedBox(height: 10,),
        SearchBar(margin: EdgeInsets.zero),
      ],
    );
  }
}

