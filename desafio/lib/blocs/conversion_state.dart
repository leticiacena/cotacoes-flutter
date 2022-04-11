//é sobre variaveis entao é sobre
//1. message superior aparecer o item selecionado
//2. Valores da API que irao aparecer

import 'package:desafio/models/coins_dto.dart';

import '../models/enum.dart';

abstract class CoinMainState {}

class CoinState extends CoinMainState {
  final List<CoinsCode> coinsList;
  final List<CoinsCode> filteredList;
  final CoinsCode? selectedCoin;
  final List<dynamic> results;

  CoinState(this.coinsList, this.filteredList, this.selectedCoin, this.results);
  factory CoinState.empty(
    List<CoinsCode> code,
    List<CoinsCode> filteredList,
    List<dynamic> results, {
    CoinsCode? selectedCoin,
  }) {
    return CoinState(code, filteredList, selectedCoin, results);
  }
} //passar string dentro do coinState

class CoinFirstState extends CoinMainState {
  final List<String> coinsList;
  final CoinsCode? baseCoin;

  CoinFirstState(this.coinsList, this.baseCoin);
  factory CoinFirstState.empty(
    List<String> code, {
    CoinsCode? baseCoin,
  }) {
    return CoinFirstState(code, baseCoin);
  }
}
/*class CoinFirstState extends CoinState {}

class CoinSelectedState extends CoinState {
  //moeda_base
  //final String? selectedCoin; //cuidado
   List<CoinsCode> code;
   String base;
   List<String> selectedCoins;

  CoinSelectedState(
      { this.base, this.code, this.selectedCoins})
      : super();

  /*get selectedBaseCoin {
    //return selectedCoin;
  }
}

class SelectedCoinsListState extends CoinState {
  //cotacao2*/
  //SelectedCoinsListState(this.selectedCoins) : super();
}*/

class ConversionShowState extends CoinMainState {
  late final List<CoinsDto> conversions;
  ConversionShowState(this.conversions);
}

class CoinsApiError extends CoinMainState {}
