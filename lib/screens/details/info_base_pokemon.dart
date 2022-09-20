// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:provider/provider.dart';
import '../../provider/pokemon_provider.dart';
import '../../constants/images.dart';
import '../home/widget/cached_network_image.dart';
import 'pokemon_inherited_widget.dart';

class InfoBase extends StatefulWidget {
  const InfoBase(this.provider, this.lista,{Key? key}) : super(key: key);
  final provider;
  final lista;

  @override
  State<InfoBase> createState() => _InfoBaseState();
}

class _InfoBaseState extends State<InfoBase> {
  AnimationController get slideController => PokemonAnimationInherited.of(context)!.slideController;
  Animation<double> get textFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(slideController);
  Size cacheMaxSize = Size(700, 700);
  final ImageProvider placeholder = AppImages.bulbasaur;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final PageController controller = PageController(initialPage: Provider.of<PokemonProvider>(context, listen: false).setIdPage(widget.lista));
    return AnimatedBuilder(
      animation: slideController,
      builder: ((context, child) {
        return Stack(
          children: [
            namePokemonWidget(theme),
            numberPokemonWidget(theme),
            typesPokemonWidget(theme),
            imagePokemonWidget(context, controller)
          ]
        );
      })
    );
  }

  Widget imagePokemonWidget(BuildContext context, PageController controller) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.50,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: PageView.builder(
          controller: controller,
          onPageChanged:((value) {
            Provider.of<PokemonProvider>(context, listen: false).selectPokemon(widget.lista[value]);
          }),
          itemCount: widget.lista.length,
          itemBuilder: (_, i) {
            return Opacity(
              opacity: textFadeAnimation.value,
              child: Container(
                child: Hero(
                  tag: widget.provider.dettaglioPokemon.id,
                  child: CachedNetworkImageWidget(pokemon: widget.provider.dettaglioPokemon)),                
              ),
            );
          }
        ),
      ),
    );
  }

  Widget typesPokemonWidget(theme) {
    return Positioned(
      top: 140,
      left: 25,
      child: IgnorePointer(
        ignoring: textFadeAnimation.value < 1,
        child: Opacity(
          opacity: textFadeAnimation.value,
          child: Row(
            children: [
              for(var i=0; i<widget.provider.dettaglioPokemon.typeofpokemon.length; i++)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black26
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: Text(widget.provider.dettaglioPokemon.typeofpokemon[i], 
                      style: theme.textTheme.subtitle1
                      .copyWith(
                        shadows: MyTheme.shadowText
                      )
                    )
                  )
                ),
              ),
            ]
          ),
        ),
      )
    );
  }

  Widget numberPokemonWidget(theme) {
    return Positioned(
      top: 120,
      right: 25,
      child: Opacity(
        opacity: textFadeAnimation.value,
        child: Text(
          widget.provider.dettaglioPokemon.id, 
          style: theme.textTheme.subtitle1
          .copyWith(
            shadows: MyTheme.shadowText
          )
        )
      ),
    );
  }

  Widget namePokemonWidget(theme) {
    return Positioned(
      top: 95 - (100-65) * slideController.value,
      left: 20 + (20 + 20) * slideController.value,
      child: Text(
        widget.provider.dettaglioPokemon.name, 
        style: 
          theme.textTheme.labelMedium!
          .copyWith(
            fontSize: 36 - (36 - 22) * slideController.value,
            shadows: MyTheme.shadowText
          )
      ),
    );
  }
}