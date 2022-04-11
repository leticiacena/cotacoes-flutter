import 'dart:convert';
import 'package:desafio/models/coins_dto.dart';
import 'package:http/http.dart' as http;

class Repositorio {
  Future<List<CoinsDto>> getCoins(
      String base, List<String> selecionadas) async {
    //parametros moeda de base + lista de moedas selecionadas

    try {
      String url = 'https://economia.awesomeapi.com.br/last/';

      for (int i = 0; i < selecionadas.length; i++) {
        if (i < selecionadas.length - 1) {
          url += '${selecionadas.elementAt(i).toString()}-${base.toString()},';
        } else {
          url += '${selecionadas.elementAt(i).toString()}-${base.toString()}';
        }
      }

      print(url);

      final response = await http.get(Uri.parse(url));

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      print(json);

      final coinsList = json.values.map((coin) {
        return CoinsDto.fromJson(coin);
      }).toList();

      //  final code = CoinsDto.fromJson(json).code;
      //  print(code);
      //  return .;
      print('*** ${coinsList.first.code}');
      //final coinsList2 = json.values.map(CoinsDto.fromJson(code: json['code'], codeIn: json['codein'], value: json['bid']));
      return coinsList;
    } catch (error) {
      print(error);
      throw Exception('Deu ruim');
    }
  }
}
