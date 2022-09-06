// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'pokemon_inherited_widget.dart';
import 'widget/tab_bar_info_widget.dart';

class ContainerInformation extends StatefulWidget {
  ContainerInformation({Key? key}) : super(key: key);
  @override
  State<ContainerInformation> createState() => _ContainerInformationState();
}

class _ContainerInformationState extends State<ContainerInformation> with SingleTickerProviderStateMixin{
  late AnimationController _autoSlideController;
  AnimationController get slideController => PokemonAnimationInherited.of(context)!.slideController;

  @override
  void initState() {
    _autoSlideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..forward();

    super.initState();
  }

  @override
  void dispose() {
    _autoSlideController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final safeArea = MediaQuery.of(context).padding;
    final appBarHeight = AppBar().preferredSize.height;
    final cardMinHeight = screenHeight * 0.54;
    final cardMaxHeight = screenHeight - appBarHeight - safeArea.top;
    var theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _autoSlideController,
      builder: (_, child) {
        return SlidingUpPanel(
          minHeight: cardMinHeight * _autoSlideController.value,
          maxHeight: cardMaxHeight,
          boxShadow: null,
          color: Colors.transparent,
          panel: child,
          onPanelSlide: (position) {
            slideController.value = position;
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
        ),
        child: TabBarInfoPokemon()
      ),
    );
  }
}

