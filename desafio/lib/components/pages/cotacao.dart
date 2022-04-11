import 'dart:html';

import 'package:desafio/models/coins_dto.dart';
import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc.dart';
import '../../models/enum.dart';

class SelectCotationPage extends StatefulWidget {
  final List<String> alteredList;
  List<String> baseCoin;
  List<String> selectedCoins;
  PageController jumpToPage;
  //ConversionBloc conversions;

  SelectCotationPage({
    Key? key,
    required this.alteredList,
    required this.baseCoin,
    required this.jumpToPage,
    required this.selectedCoins,
  }) : super(key: key);

  @override
  State<SelectCotationPage> createState() => _SelectCotationPageState();
}

class _SelectCotationPageState extends State<SelectCotationPage> {
  var results;

  @override
  void initState() {
    super.initState();
  }

  int currentPage = 0;
  PageController pageController = PageController();

  List<bool> tapOn = [false, false, false, false, false];

  onTapListTileCoin(int index) {
    //cont++;
    setState(() {
      print('*** chegoooooou aqui ***');
      tapOn[index] = !tapOn[index];

      //dar um jeito de e
      widget.selectedCoins.add(widget.alteredList[index]);
    });
  }

  Future<void> jumpPage() async {
    await widget.jumpToPage.animateToPage(2,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  Color tapOnOff(int index) {
    return tapOn[index] ? ColorItems().blue : ColorItems().gray;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //componentizar - deixar isso aqui por fora de forma que um metodo mais acima passe como parametro o titulo
        title: const Text(
          Strings.appBarTitle2,
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(31, 93, 93, 93),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(Strings.message2(
                widget.baseCoin.first)), //passar aqui bloc da moeda selecionada
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.alteredList.length,
              itemBuilder: (context, index) {
                final moeda = widget.alteredList[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: tapOn[index]
                          ? ColorItems().blue
                          : ColorItems().darkGray,
                    )),
                    child: ListTile(
                      selectedColor: ColorItems().blue,
                      enabled: true,
                      leading: const Icon(Icons.attach_money_sharp),
                      //hoverColor: colorHover[],
                      iconColor: tapOnOff(index),
                      textColor: tapOnOff(index),
                      title: Text(
                        moeda,
                      ),
                      onTap: () => onTapListTileCoin(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              //onPressed: pageController,//.jumpToPage(2),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                if (widget.selectedCoins.isNotEmpty) {
                  // widget.conversions.getScreenCoins();

                  //widget.selectedCoins
                  jumpPage();
                } else {
                  //Mostrar aviso
                }
              },
              child: const Text(
                Strings.prox,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
    // }),
    // ],
    //);
  }
}
