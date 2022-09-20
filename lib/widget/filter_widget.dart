import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../provider/pokemon_provider.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget(this.provider, {Key? key}) : super(key: key);
  final provider;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Positioned(
      top: 110,
      left: 20,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text('Result for: ${provider.filterSearch}', style: theme.textTheme.subtitle2),
              SizedBox(width: 10),
              InkWell(
                onTap: () {Provider.of<PokemonProvider>(context, listen: false).removeFilter(context);},
                child: Icon(Icons.close, color: Colors.grey,)
              )
            ],
          ),
        )
      ),
    );
  }
}