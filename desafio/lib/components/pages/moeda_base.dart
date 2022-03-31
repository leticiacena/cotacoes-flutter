import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';

import '../cardCoin.dart';

class PageViewItem1 extends StatefulWidget {
  var message;
  var pageTitle;

  PageViewItem1({Key? key, required this.message, required this.pageTitle})
      : super(key: key);

  @override
  State<PageViewItem1> createState() =>
      _PageViewItemState(message: message, pageTitle: pageTitle);
}

class _PageViewItemState extends State<PageViewItem1> {
  var message;
  var pageTitle;

  _PageViewItemState({required this.message, required this.pageTitle});

  int currentPage = 0;
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
          CardCoin(name: Strings.real),
          CardCoin(name: Strings.libra),
          CardCoin(name: Strings.ester),
          CardCoin(name: Strings.dolar),
          CardCoin(name: Strings.peso),
          CardCoin(name: Strings.iene),
        ],
      ),
    );
    // }),
    // ],
    //);
  }
}
