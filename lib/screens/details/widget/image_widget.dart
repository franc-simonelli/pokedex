// // ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, unused_local_variable, prefer_const_declarations, sized_box_for_whitespace, avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../provider/pokemon_provider.dart';
// import '../../../constants/images.dart';
// import '../../home/widget/cached_network_image.dart';

// class ImageWidget extends StatefulWidget {
//   ImageWidget(this.provider, {Key? key}) : super(key: key);
//   final provider;

//   @override
//   State<ImageWidget> createState() => _ImageWidgetState();
// }

// class _ImageWidgetState extends State<ImageWidget> with TickerProviderStateMixin{

//   @override
//   Widget build(BuildContext context) {
//     const Size cacheMaxSize = Size(700, 700);
//     final ImageProvider placeholder = AppImages.bulbasaur;
    
//     final PageController controller = PageController(initialPage: Provider.of<PokemonProvider>(context, listen: false).setIdPage());
//     return Positioned(
//         bottom: MediaQuery.of(context).size.height * 0.50,
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: 180,
//           child: PageView.builder(
//             controller: controller,
//             onPageChanged:((value) {
//               Provider.of<PokemonProvider>(context, listen: false).selectPokemon(widget.provider.listaPokemon[value]);
//               // animated();
//             }),
//             itemCount: widget.provider.listaPokemon.length,
//             itemBuilder: (_, i) {
//               return Container(
//                 child: Hero(
//                   tag: widget.provider.dettaglioPokemon.id,
//                   child: CachedNetworkImageWidget(pokemon: widget.provider.dettaglioPokemon)),
//                 // child: Image.network(widget.provider.dettaglioPokemon.imageurl, width: 50,),
                
//               );
            
//             }
//           ),
//         ),
//       );
      
//   }
// }