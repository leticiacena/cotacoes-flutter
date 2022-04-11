enum CoinsCode {
  BRL,
  EUR,
  USD,
  GBP /*Libra esterlina e Peso*/,
}

String convertEnum(CoinsCode? code) {
  switch (code) {
    case CoinsCode.BRL:
      return 'Real';

    case CoinsCode.EUR:
      return 'Euro';

    case CoinsCode.GBP:
      return 'Libra Esterlina';

    default:
      return 'Dólar Americano';
  }
}

String convertStringToEnum(String name) {
  switch (name) {
    case 'Real':
      return CoinsCode.BRL.name;

    case 'Euro':
      return CoinsCode.EUR.name;

    case 'Libra Esterlina':
      return CoinsCode.GBP.name;

    default:
      return CoinsCode.USD.name;
  }
}
