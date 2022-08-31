// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  SearchBar({
    this.margin = const EdgeInsets.symmetric(horizontal: 28),
  });

  final EdgeInsets margin;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchWithDebounce);
  }

  _onSearchWithDebounce() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      searchText();
    });
  }

  void searchText() {
    Provider.of<PokemonProvider>(context, listen: false).searchPokemon(_searchController.text, context);
  }
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);    
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      margin: widget.margin,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(-1, -1),
            color: MediaQuery.platformBrightnessOf(context) == Brightness.light ? Colors.white : Colors.grey.shade800
          ),
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
            color: MediaQuery.platformBrightnessOf(context) == Brightness.light ? Colors.grey.shade400 : Colors.black
          )
        ]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 26, color: Colors.grey),
          SizedBox(width: 20,),
          Expanded(
            child: TextFormField(
              controller: _searchController,
              style: TextStyle(color: Colors.grey),
              cursorColor: Colors.grey.shade600,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search Pokemon',
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}