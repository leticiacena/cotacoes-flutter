import 'dart:html';

import 'package:desafio/blocs/conversion_state.dart';
import 'package:desafio/models/enum.dart';
import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc.dart';

class BaseCoinPage extends StatefulWidget {
  //final list = ['BRL', 'EUR', 'BTC'];
  final List<CoinsCode> coinsList;
  final List<String> alteredList;
  List<String> baseCoin;

  PageController jumpToPage;

  BaseCoinPage(
      {Key? key,
      required this.coinsList,
      required this.alteredList,
      required this.jumpToPage,
      required this.baseCoin})
      : super(key: key);

  @override
  State<BaseCoinPage> createState() => _BaseCoinPageState();
}

class _BaseCoinPageState extends State<BaseCoinPage> {
//late final ConversionBloc _bloc2;
  int currentPage = 0;
  PageController pageController = PageController();
  List<bool> tapOn = [false, false, false, false, false];

  onTapListTileCoin(int index) {
    //cont++;
    setState(() {
      print('*** chegoooooou aqui ***');
      tapOn[index] = !tapOn[index];

      for (int i = 0; i < widget.coinsList.length; i++) {
        //dar um jeito de e
        widget.alteredList.add(convertEnum(widget.coinsList[i]));
      }

      widget.alteredList.removeAt(index);
      //widget.baseCoin = widget.coinsList[index];
      print(widget.baseCoin);

      widget.baseCoin.add(convertEnum(widget.coinsList[index]));
      //widget.baseCoin2.

      //widget.setSelectedCoin(widget.coinsList[index]);

      //setSelectedCoin(widget.coinsList[index].toString());
      jumpPage(index);
    });
  }

  Future<void> jumpPage(int index) async {
    await widget.jumpToPage.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  Color tapOnOff(int index) {
    return tapOn[index] ? ColorItems().blue : ColorItems().gray;
  }

  //debugPrint(pageIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //componentizar - deixar isso aqui por fora de forma que um metodo mais acima passe como parametro o titulo
        title: Text(
          Strings.appBarTitle1,
          style: TextStyle(color: ColorItems().blue),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(31, 93, 93, 93),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(Strings.message1),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.coinsList.length,
              itemBuilder: (context, index) {
                //final changeColor = false;

                final moeda = widget.coinsList[index];
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
                      leading: const Icon(Icons.attach_money_sharp),
                      iconColor: tapOnOff(index),
                      textColor: tapOnOff(index),
                      title: Text(
                        convertEnum(moeda),
                      ),
                      //onTap: () {
                      //   setState(() => tapOn[index] = !tapOn[index]);
                      // },
                      onTap: () => onTapListTileCoin(index),
                    ),
                  ),
                );
              },
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
