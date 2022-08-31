
// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pokedex/data/map_pokemon_data.dart';
import 'package:pokedex/models/json/pokemon_json_model.dart';
import 'package:pokedex/provider/modal_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/pokemon_service.dart';
import 'progress_bar_provider.dart';

class PokemonProvider extends ChangeNotifier {

  List<PokemonJsonFromApi> _listaPokemonFromJson = [];

  List<PokemonJson> _generation = [];
  List<PokemonJson> _listaPokemon = [];
  List<PokemonJson> _1generazione = [];
  List<PokemonJson> _2generazione = [];
  List<PokemonJson> _3generazione = [];
  List<PokemonJson> _4generazione = [];
  List<PokemonJson> _5generazione = [];
  List<PokemonJson> _6generazione = [];
  List<PokemonJson> _7generazione = [];
  List<PokemonJson> _8generazione = [];
  late PokemonJson _dettaglioPokemon;
  List<String> _totalProgress = [];
  List<String> _typeFilterList = [];

  String _generationSelect = '1_gen';
  List<PokemonJson> _currentGeneration = [];

  String _filterSearch = '';

  int startIndex = 0;
  int endIndex = 0;
  String generation = '';

  bool _loading = false;
  bool _isDownload = false;
  PokemonJson get dettaglioPokemon => _dettaglioPokemon;
  List<PokemonJson> get listaPokemon => _listaPokemon;
  bool get loading => _loading;
  bool get isDownload => _isDownload;
  String get filterSearch => _filterSearch;
  List<String> get typeFilter => _typeFilterList;

  setListaOrdinata(lista) {
    _listaPokemon = lista;
    notifyListeners();
  }

  removeAllTypeFilter() {
    _typeFilterList = [];
    _listaPokemon = _currentGeneration;
    notifyListeners();
  }

  checkButtonRemoveAll() {
    if(_typeFilterList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  checkOpacityTypeFilter(type) {
    if(_typeFilterList.contains(type)) {
      return true;
    } else {
      return false;
    }
  }

  createListFilterByTypes(context) {
    _listaPokemon = [];

    if(_typeFilterList.isEmpty) {
      _listaPokemon = _currentGeneration;
    }
    else {
      bool checkAllGen = Provider.of<ModalProvider>(context, listen: false).checkSearchTypes;
      var list = checkAllGen ? _1generazione + _2generazione + _3generazione + _4generazione + _5generazione + _6generazione + _7generazione : _currentGeneration;
    
      for(var i =0; i < _typeFilterList.length; i++) {
        var newList = list.where((x) => x.typeofpokemon.contains(_typeFilterList[i])).toList();

        if(_typeFilterList.length == 1) {
          _listaPokemon = newList;
        }else {
          _listaPokemon = _listaPokemon + newList;
        }
        _listaPokemon.sort((a, b) => a.id.compareTo(b.id));
      }
      var seen = Set<PokemonJson>();
      List<PokemonJson> uniquelist = _listaPokemon.where((id) => seen.add(id)).toList();
      _listaPokemon = uniquelist;    
    }
    notifyListeners();
  }
  
  setTypeFilter(filter, context) {
    _typeFilterList.contains(filter) ? _typeFilterList.remove(filter) : _typeFilterList.add(filter); 
    _typeFilterList = _typeFilterList.toSet().toList();
    _filterSearch = '';
    createListFilterByTypes(context);
  }

  removeFilter(context) {
    _filterSearch = '';
    searchPokemon('', context);
    notifyListeners();
  }

  searchPokemon(text, context) {
    _filterSearch = text;
    bool check = Provider.of<ModalProvider>(context, listen: false).checkSearch;
    if(check) {
      var listaAllGen = _1generazione + _2generazione + _3generazione + _4generazione + _5generazione + _6generazione + _7generazione;
      _listaPokemon = listaAllGen.where((x) => x.name.toLowerCase().contains(text.toLowerCase() )).toList();
    } else {
      _listaPokemon = _currentGeneration.where((x) => x.name.toLowerCase().contains(text.toLowerCase() )).toList();
      
    }
    notifyListeners();
  }

  changeGeneration(generation) async {
    final prefs = await SharedPreferences.getInstance();
    switch(generation) {
      case 'Generation I':
        final String? pokemon = prefs.getString('1_gen');
        _listaPokemon = PokemonJson.decode(pokemon!);
        _generationSelect = '1_gen';
        _currentGeneration = _listaPokemon;
        notifyListeners();
        break;
      case 'Generation II':
        final String? pokemon = prefs.getString('2_gen');
        _listaPokemon = PokemonJson.decode(pokemon!);
        _generationSelect = '2_gen';
        _currentGeneration = _listaPokemon;
        notifyListeners();
        break;
      case 'Generation III':
        final String? pokemon = prefs.getString('3_gen');
        _listaPokemon = PokemonJson.decode(pokemon!);
        _generationSelect = '3_gen';
        _currentGeneration = _listaPokemon;
        notifyListeners();
        break;
      case 'Generation IV':
        final String? pokemon = prefs.getString('4_gen');
        _listaPokemon = PokemonJson.decode(pokemon!);
        _generationSelect = '4_gen';
        _currentGeneration = _listaPokemon;
        notifyListeners();
        break;
      case 'Generation V':
        final String? pokemon = prefs.getString('5_gen');
        _listaPokemon = PokemonJson.decode(pokemon!);
        _generationSelect = '5_gen';
        _currentGeneration = _listaPokemon;
        notifyListeners();
        break;
      case 'Generation VI':
        final String? pokemon = prefs.getString('6_gen');
        _listaPokemon = PokemonJson.decode(pokemon!);
        _generationSelect = '6_gen';
        _currentGeneration = _listaPokemon;
        notifyListeners();
        break;
      case 'Generation VII':
        final String? pokemon = prefs.getString('7_gen');
        _listaPokemon = PokemonJson.decode(pokemon!);
        _currentGeneration = _listaPokemon;
        _generationSelect = '7_gen';
        notifyListeners();
        break;
    }
  }
  
  getPokemonById(id) {
    PokemonJson pok = PokemonJson();

    var listaCompleta = _1generazione + _2generazione + _3generazione + _4generazione + _5generazione + _6generazione + _7generazione;
    for(var i=0; i<listaCompleta.length; i++) {
      if(listaCompleta[i].id == id) {
        pok = listaCompleta[i];
        break;
      }
    }
    return pok;

  }

  selectPokemon(pokemon) {
    _dettaglioPokemon = pokemon;
    notifyListeners();
  }

  setIdPage() {
    for(var i=0; i < _listaPokemon.length; i++) {
      if(_dettaglioPokemon.id == _listaPokemon[i].id) {
        return i;
      }
    }
  }

  createListPokemonFromJson(start, end, gen, context) async {
    notifyListeners();
    if(_listaPokemonFromJson.isEmpty) {
      var _pokemonService = Injector().get<PokemonService>();
      _listaPokemonFromJson = await _pokemonService.getAllPokemonFromJson();
      await createGeneration(start, end, gen, context);
    }else {
      await createGeneration(start, end, gen, context);
    }
    
  }

  createGeneration(start, end, gen, context) async {
    _generation = [];
    var index = 0;
    
    for(var i=start; i<end; i++) {
      var _pokemonService = Injector().get<PokemonService>();
      var info = await _pokemonService.getInformationById(i+1);
      var _pokemonMapping = Injector().get<MapPokemonData>();
      PokemonJson pok = PokemonJson();
      pok = _pokemonMapping.mappingPokemon(_listaPokemonFromJson[i], info, i+1, context);
      _generation.add(pok);
      _totalProgress.add(pok.id);
      Provider.of<ProgressBarProvider>(context, listen: false).setProgress(_totalProgress.length.toDouble());
     
    }
    final prefs = await SharedPreferences.getInstance();
    final String encodedata = PokemonJson.encode(_generation);
    await prefs.setString(gen, encodedata);
    saveInLocalSwicth(_generation, gen);

    _loading = false;
    
  }

  saveInLocalSwicth(_generation, gen) {
    switch(gen) {
      case '1_gen':
        _1generazione = _generation;
        break;
      case '2_gen':
        _2generazione = _generation;
        break;
      case '3_gen':
        _3generazione = _generation;
        break; 
      case '4_gen':
        _4generazione = _generation;
        break;
      case '5_gen':
        _5generazione = _generation;
        break; 
      case '6_gen':
        _6generazione = _generation;
        break;
      case '7_gen':
        _7generazione = _generation;
        break; 
    }
  }

  remove() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('1_gen');
    prefs.remove('2_gen');
    prefs.remove('3_gen');
    prefs.remove('4_gen');
    prefs.remove('5_gen');
    prefs.remove('6_gen');
    prefs.remove('7_gen');
  }

  initPokemon(context) async {
    final prefs = await SharedPreferences.getInstance();
    final String? pokemon1 = prefs.getString('1_gen');
    final String? pokemon2 = prefs.getString('2_gen');
    final String? pokemon3 = prefs.getString('3_gen');
    final String? pokemon4 = prefs.getString('4_gen');
    final String? pokemon5 = prefs.getString('5_gen');
    final String? pokemon6 = prefs.getString('6_gen');
    final String? pokemon7 = prefs.getString('7_gen');

    if(pokemon1 != null) {
      _1generazione = PokemonJson.decode(pokemon1);
      _currentGeneration = _1generazione;
      
    }else {
      _isDownload = true;
      await createListPokemonFromJson(0, 151, '1_gen', context);
    }

    if(pokemon2 != null) {
      _2generazione = PokemonJson.decode(pokemon2);
    }else {
      await createListPokemonFromJson(151, 251, '2_gen', context);
    }

    if(pokemon3 != null) {
      _3generazione = PokemonJson.decode(pokemon3);
    }else {
      await createListPokemonFromJson(251, 386, '3_gen', context);
    }

    if(pokemon4 != null) {
      _4generazione = PokemonJson.decode(pokemon4);
    }else {
      await createListPokemonFromJson(386, 493, '4_gen', context);
    }

    if(pokemon5 != null) {
      _5generazione = PokemonJson.decode(pokemon5);
    }else {
      await createListPokemonFromJson(493, 649, '5_gen', context);
    }

    if(pokemon6 != null) {
      _6generazione = PokemonJson.decode(pokemon6);
      _loading = false;
    }else {
      _loading = false;
      await createListPokemonFromJson(649, 721, '6_gen', context);
    }

    if(pokemon7 != null) {
      _7generazione = PokemonJson.decode(pokemon7);
      _loading = false;
    }else {
      _loading = false;
      await createListPokemonFromJson(721, 809, '7_gen', context);
    }

    _listaPokemon = _1generazione;
    _isDownload = false;
    notifyListeners();
  }

  getColor(String type){
    var _pokemonMapping = Injector().get<MapPokemonData>();
    return _pokemonMapping.mappingColors(type);
  }

  getAllGenerations() {
    return _1generazione + _2generazione + _3generazione + _4generazione + _5generazione + _6generazione + _7generazione;
  }

  getNewList(list, filter) {
    var newList = list.where((x) => x.typeofpokemon.contains(filter)).toList();
    return newList;
  }
}
  