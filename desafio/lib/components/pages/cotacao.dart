import 'dart:html';

import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';

import '../cardCoin.dart';

class PageViewItem2 extends StatefulWidget {
  var message;
  var pageTitle;

  PageViewItem2({Key? key, required this.message, required this.pageTitle})
      : super(key: key);

  @override
  State<PageViewItem2> createState() =>
      _PageViewItemState(message: message, pageTitle: pageTitle);
}

class _PageViewItemState extends State<PageViewItem2> {
  var message;
  var pageTitle;

  _PageViewItemState({required this.message, required this.pageTitle});

  int currentPage = 0;
  int cont = 0;
  PageController pageController = PageController();

  void onItemPressed(int index) {
    // pagepageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 400),
    //   curve: Curves.bounceInOut,
    // );
    setState(() {
      currentPage = index;
      pageController.jumpToPage(1);
    });
  }

  void onPressed() {
    //checar se algo foi selecionado
    //pular para a proxima pagina
  }

  List<Color> iconColor = [
    ColorItems().gray,
    ColorItems().gray,
    ColorItems().gray,
    ColorItems().gray
  ];

  // = ColorItems().gray;
  List<Color> textColor = [
    ColorItems().gray,
    ColorItems().gray,
    ColorItems().gray,
    ColorItems().gray
  ];

  bool tapOn = false;

  onTapListTileCoin(int index) {
    cont++;
    setState(() {
      // selectedCoin = widget.name;

      if (iconColor[index] == ColorItems().gray) {
        // selectedCoinTap = true;
        iconColor[index] = ColorItems().blue;
        textColor[index] = ColorItems().blue;
      } else {
        iconColor[index] = ColorItems().gray;
        textColor[index] = ColorItems().gray;
        //  selectedCoinTap = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: const TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(31, 93, 93, 93),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(widget.message),
          ),
          /*CardCoin(name: Strings.real),
          CardCoin(name: Strings.libra),
          CardCoin(name: Strings.ester),
          CardCoin(name: Strings.dolar),
          CardCoin(name: Strings.peso),
          CardCoin(name: Strings.iene),*/
          Expanded(
            child: ListView.builder(
              itemCount: Strings.moedas.length - 1,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    leading: const Icon(Icons.attach_money_sharp),
                    enabled: true,
                    //hoverColor: colorHover,
                    iconColor: iconColor[index],
                    textColor: textColor[index],
                    title: Text(
                      Strings.moedas[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: onTapListTileCoin(index),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Text(
                'Próximo',
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
