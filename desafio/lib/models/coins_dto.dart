class CoinsDto {
  final String code;
  final String codeIn;
  final double value; //valor da moeda
  //List<Results>? results;

  CoinsDto({required this.code, required this.codeIn, required this.value});
  //CoinsDto{{}});

  factory CoinsDto.fromJson(Map<String, dynamic> json) {
    final code = json['code'];
    final codeIn = json['codein'];
    final value = double.parse(json['bid']);

    return CoinsDto(code: code, codeIn: codeIn, value: value);
  }
}
