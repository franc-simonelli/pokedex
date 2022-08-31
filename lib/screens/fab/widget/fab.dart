// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class FabItemData {
  final IconData icon;
  final void Function()? onPress;
  final String title;
  final Color colorIcon;

  const FabItemData(this.title, this.icon, this.colorIcon, {this.onPress});
}

class FabItem extends StatelessWidget {
  final FabItemData item;

  const FabItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    
    return MaterialButton(
      shape: StadiumBorder(),
      padding: EdgeInsets.fromLTRB(24, 8, 16, 8),
      color: theme.primaryColor,
      splashColor: theme.splashColor,
      highlightColor: Colors.grey[100],
      elevation: 0,
      highlightElevation: 2,
      disabledColor: theme.backgroundColor,
      onPressed: item.onPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(item.title, style: theme.textTheme.subtitle2,),
          SizedBox(width: 8),
          Icon(item.icon, color: item.colorIcon),
        ],
      ),
    );
  }
}

class ExpandedAnimationFab extends AnimatedWidget {
  final List<FabItemData> items;
  final void Function()? onPress;

  ExpandedAnimationFab({
    required this.items,
    required Animation animation,
    this.onPress,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IgnorePointer(
          ignoring: animation.value == 0,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 12),
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, __) => SizedBox(height: 9),
            itemBuilder: _buildItem,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: theme.splashColor, width: 2)
            ),
            child: FloatingActionButton(
              backgroundColor: theme.primaryColor,
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: animation,
                color: theme.splashColor,
              ),
              onPressed: onPress,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    final transform = Matrix4.translationValues(
      -(screenWidth - animation.value * screenWidth) * ((items.length - index) / 4),
      0.0,
      0.0,
    );

    return Align(
      alignment: Alignment.centerRight,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: animation.value,
          child: FabItem(items[index]),
        ),
      ),
    );
  }
}
