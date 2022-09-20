import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../provider/pokemon_provider.dart';
import '../utils/theme.dart';

class FilterTypesWidget extends StatelessWidget {
  const FilterTypesWidget(this.provider, {Key? key}) : super(key: key);
  final provider; 
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Positioned(
      top: 110,
      left: 20,
      right: 10,
      child: Row(
        children: [
          Text("Filter: ", style: theme.textTheme.subtitle2),
          Container(
            width: 310,
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: provider.typeFilter.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Provider.of<PokemonProvider>(context, listen: false).getColor(provider.typeFilter[index]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            provider.typeFilter[index], 
                            style: theme.textTheme.subtitle2!.copyWith(
                              color: Colors.white, 
                              shadows: MyTheme.shadowTextType
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, ),
                            child: InkWell(
                              onTap: () { Provider.of<PokemonProvider>(context, listen: false).setTypeFilter(provider.typeFilter[index], context);},
                              child: Icon(Icons.close, color: Colors.white, shadows: MyTheme.shadowTextType,)),
                          )
                        ],
                      ),
                    )
                  ),
                ); 
              }
            )
          ),
        ],
      ),





    );
  }
}