// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:pokedex/extensions/animation.dart';
import 'package:pokedex/screens/fab/widget/all_type_modal.dart';
import 'package:pokedex/screens/preferiti/preferiti_screen.dart';
import 'package:pokedex/utils/routes.dart';

import 'widget/animated_overlay.dart';
import 'widget/fab.dart';
import 'widget/generation_modal.dart';
import 'widget/search_modal.dart';

class FabMenu extends StatefulWidget {
  FabMenu();

  @override
  State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> with SingleTickerProviderStateMixin {
  late AnimationController _fabController;
  late Animation<double> _fabAnimation;

  bool _isFabMenuVisible = false;

  @override
  void initState() {
    _fabController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    _fabAnimation = _fabController.curvedTweenAnimation(
      begin: 0.0,
      end: 1.0,
    );

    super.initState();
  }

  @override
  void dispose() {
    _fabController.dispose();

    super.dispose();
  }

  void _toggleFabMenu() {
    _isFabMenuVisible = !_isFabMenuVisible;
    if (_isFabMenuVisible) {
      _fabController.forward();
    } else {
      _fabController.reverse();
    }
  }

  void _showTypeModal() {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: AllTypeModal(),
        ),
      );
  }

  void _showSearchModal() {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SearchBottomModal(),
        ),
      );
  }

  void _showGenerationModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GenerationModal(),
    );
  }

  void onPress([Function? callback]) {
    _toggleFabMenu();
    callback?.call();
  }

  goToFavorite() {
    // AppNavigator.push(Routes.favoritePokemon);
    Navigator.pushNamed(context, PreferitiScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    var theme = Theme.of(context);

    return AnimatedOverlay(
      animation: _fabAnimation,
      color: Colors.transparent,
      onPress: _toggleFabMenu,
      child: Container(
        alignment: Alignment.bottomRight,
        // padding: EdgeInsets.only(right: 26, bottom: 26 + safeAreaBottom),
        child: ExpandedAnimationFab(
          animation: _fabAnimation,
          onPress: _toggleFabMenu,
          items: [
            FabItemData(
              'Favourite Pokemon',
              Icons.favorite,
              onPress: () => onPress(
                goToFavorite()
              ),
              Colors.red,
            ),
            FabItemData(
              'All Type',
              Icons.filter_vintage,
              onPress: () => onPress(_showTypeModal),
              Colors.green
            ),
            FabItemData(
              'All Gen',
              Icons.flash_on,
              onPress: () => onPress(_showGenerationModal),
              Colors.yellow.shade900
            ),
            FabItemData(
              'Search',
              Icons.search,
              onPress: () => onPress(_showSearchModal),
              Colors.blue
            ),
          ],
        ),
      ),
    );
  }
}
