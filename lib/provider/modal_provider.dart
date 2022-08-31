import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:provider/provider.dart';

class ModalProvider extends ChangeNotifier {
  bool _checkSearch = false;
  bool _checkSearchTypes = false;
  String _orderBy = 'N° Pokedex';
  bool _crescente = true;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  bool get checkSearch => _checkSearch;
  bool get checkSearchTypes => _checkSearchTypes;
  GlobalKey get drawer => _drawerKey;
  String get orderBy => _orderBy;
  bool get crescente => _crescente;

  setCrescenteDecrescente(context) {
    _crescente = !_crescente;
    var lista = Provider.of<PokemonProvider>(context, listen: false).listaPokemon;
    lista = lista.reversed.toList();
    Provider.of<PokemonProvider>(context, listen: false).setListaOrdinata(lista);
    notifyListeners();
  }

  onTappedBar(){
    _drawerKey.currentState?.openDrawer();   
    notifyListeners();       
  }

  setOrderBy(order, context) {
    _orderBy = order;
    var lista = bubbleSort(context, order);
    if(!_crescente) {
      lista = lista.reversed.toList();
    }
    Provider.of<PokemonProvider>(context, listen: false).setListaOrdinata(lista);
    notifyListeners();
  }

  bubbleSort(context, order) {

    var listaPokemon = Provider.of<PokemonProvider>(context, listen: false).listaPokemon;

    switch(order) {
      case 'N° Pokedex':
        return orderByIndex(listaPokemon);
      case 'Hp':
        return orderByHp(listaPokemon);
      case 'Attack':
        return orderByAttack(listaPokemon);
      case 'Defense':
        return orderByDefense(listaPokemon);
      case 'Sp.Atk':
        return orderBySpAtk(listaPokemon);
      case 'Sp.Def':
        return orderBySpDef(listaPokemon);
      case 'Speed':
        return orderBySpeed(listaPokemon);
      case 'Total':
        return orderByTotal(listaPokemon);
    }

  
  }

  orderByIndex(listaPokemon) {
    for (int i = 0; i <  listaPokemon.length- 1; i++) {
      for (int j = 0; j < listaPokemon.length - i - 1; j++) {
        
        if (listaPokemon[j].numberPokedex > listaPokemon[j + 1].numberPokedex) {
          var temp = listaPokemon[j];
          listaPokemon[j] = listaPokemon[j + 1];
          listaPokemon[j + 1] = temp;
        }
      }
    }
    return listaPokemon;
  }

  orderByHp(listaPokemon) {
    for (int i = 0; i <  listaPokemon.length- 1; i++) {
      for (int j = 0; j < listaPokemon.length - i - 1; j++) {
        
        if (listaPokemon[j].hp > listaPokemon[j + 1].hp) {
          var temp = listaPokemon[j];
          listaPokemon[j] = listaPokemon[j + 1];
          listaPokemon[j + 1] = temp;
        }
      }
    }
    return listaPokemon;
  }

  orderByAttack(listaPokemon) {
    for (int i = 0; i <  listaPokemon.length- 1; i++) {
      for (int j = 0; j < listaPokemon.length - i - 1; j++) {
        
        if (listaPokemon[j].attack > listaPokemon[j + 1].attack) {
          var temp = listaPokemon[j];
          listaPokemon[j] = listaPokemon[j + 1];
          listaPokemon[j + 1] = temp;
        }
      }
    }
    return listaPokemon;
  }

  orderByDefense(listaPokemon) {
    for (int i = 0; i <  listaPokemon.length- 1; i++) {
      for (int j = 0; j < listaPokemon.length - i - 1; j++) {
        
        if (listaPokemon[j].hp > listaPokemon[j + 1].hp) {
          var temp = listaPokemon[j];
          listaPokemon[j] = listaPokemon[j + 1];
          listaPokemon[j + 1] = temp;
        }
      }
    }
    return listaPokemon;
  }

  orderBySpAtk(listaPokemon) {
    for (int i = 0; i <  listaPokemon.length- 1; i++) {
      for (int j = 0; j < listaPokemon.length - i - 1; j++) {
        
        if (listaPokemon[j].special_attack > listaPokemon[j + 1].special_attack) {
          var temp = listaPokemon[j];
          listaPokemon[j] = listaPokemon[j + 1];
          listaPokemon[j + 1] = temp;
        }
      }
    }
    return listaPokemon;
  }

  orderBySpDef(listaPokemon) {
    for (int i = 0; i <  listaPokemon.length- 1; i++) {
      for (int j = 0; j < listaPokemon.length - i - 1; j++) {
        
        if (listaPokemon[j].special_defense > listaPokemon[j + 1].special_defense) {
          var temp = listaPokemon[j];
          listaPokemon[j] = listaPokemon[j + 1];
          listaPokemon[j + 1] = temp;
        }
      }
    }
    return listaPokemon;
  }

  orderBySpeed(listaPokemon) {
    for (int i = 0; i <  listaPokemon.length- 1; i++) {
      for (int j = 0; j < listaPokemon.length - i - 1; j++) {
        
        if (listaPokemon[j].speed > listaPokemon[j + 1].speed) {
          var temp = listaPokemon[j];
          listaPokemon[j] = listaPokemon[j + 1];
          listaPokemon[j + 1] = temp;
        }
      }
    }
    return listaPokemon;
  }

  orderByTotal(listaPokemon) {
    for (int i = 0; i <  listaPokemon.length- 1; i++) {
      for (int j = 0; j < listaPokemon.length - i - 1; j++) {
        
        if (listaPokemon[j].total > listaPokemon[j + 1].total) {
          var temp = listaPokemon[j];
          listaPokemon[j] = listaPokemon[j + 1];
          listaPokemon[j + 1] = temp;
        }
      }
    }
    return listaPokemon;
  }

  setCheckSearch(context) {
    _checkSearch = !_checkSearch;

    var filterSearch = Provider.of<PokemonProvider>(context, listen: false).filterSearch;

    if(filterSearch != '') {
      Provider.of<PokemonProvider>(context, listen: false).searchPokemon(filterSearch, context);
    }
    
    notifyListeners();
  }

  setCheckSearchTypes(context) {
    _checkSearchTypes = !_checkSearchTypes;
    Provider.of<PokemonProvider>(context, listen: false).createListFilterByTypes(context);
    
    notifyListeners();
  }
}