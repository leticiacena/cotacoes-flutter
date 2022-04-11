import 'package:bloc/bloc.dart';
import '../models/enum.dart';
import '../repository/api_call.dart';
import 'conversion_state.dart';

class ConversionBloc extends Cubit<CoinMainState> {
  final Repositorio repository;
  //final CoinsCode code;

  //factoryConversionBloc();
  ConversionBloc(this.repository, this.alteredList)
      : super(CoinState.empty(
            [CoinsCode.BRL, CoinsCode.EUR, CoinsCode.GBP, CoinsCode.USD],
            <CoinsCode>[],
            []));
  List<String> alteredList; // = ['BRL', 'EUR', 'BTC'];
  List<String> baseCoin = [];
  List<String> selectedCoins = [];
  var conversions = [];

  void setSelectedCoin(String baseCoin) {
    //this.baseCoin = convertStringToEnum(baseCoin);
    // emit(CoinFirstState(alteredList, this.baseCoin));
  }

  Future<List<dynamic>> getScreenCoins() async {
    try {
      //emit(state.);
      //receber do front?? aqui

      //emit(SelectedCoinsListState());
      print('antes da conversao - baseCoin: ${baseCoin.first}');
      String baseCode = convertStringToEnum(baseCoin.first);
      List<String> selectedCodes = [];

      for (int i = 0; i < selectedCoins.length; i++) {
        selectedCodes.add(convertStringToEnum(selectedCoins[i]));
      }
      //emit(CoinFirstState([baseCode], selectedCodes));
      print('baseCode: $baseCode e lista ${selectedCodes.first}');

      conversions = await repository.getCoins(baseCode, selectedCodes);
      //emit(ConversionShowState(conversions));
      //emit(CoinState(alteredList, selectedCodes, conversions));
      return conversions;
      //final jsonList = await repository.getCoins(dados do front);

//receber da UI
      //if index==0 emit(CoinSelectedState())
      //if index==1 emit(SelectedCoinsList)
    } catch (e) {
      throw CoinsApiError();
    }
  }

  /*CoinSelectedState coinSelectedAction() {
    //return;
  }*/

  void coinsListSelectedAction() {}
}
