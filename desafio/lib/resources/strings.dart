class Strings {
  static const appBarTitle1 = 'Moeda base';
  static const appBarTitle2 = 'Cotação';
  static const appBarTitle3 = 'Resultado';
  static const message1 = 'Selecione uma moeda base para as converções';
  static const prox = 'Próximo';
  static const done = 'Concluir';
  var _selectedCoin = '';

  get selectedCoin => _selectedCoin;

  set selectedCoin(selectedCoin) {
    _selectedCoin = selectedCoin;
  }

  static const List<String> selectedCoins = [];
  static const real = 'Real';
  static const libra = 'Libra';
  static const ester = 'Esterlina';
  static const dolar = 'Dólar Americano';
  static const peso = 'Peso Argentino';
  static const iene = 'Iene';
  static const List<String> moedas = [
    'Real',
    'Libra',
    'Esterlina',
    'Dólar Americano',
    'Peso Argentino',
    'Iene'
  ];
  //fazer moedas - 1 cotacao menos
  static String message2(String moeda) =>
      'Selecione as moedas a serem cotadas em $moeda';
  static String message3(String moeda) =>
      'Confira os valores de compra referentes ao $moeda';

  /*Example:
  static String distanceFromMe(String distance) =>
      'Distância de mim: $distance';*/
}
