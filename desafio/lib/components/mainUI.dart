import 'package:desafio/components/pages/cotacao.dart';
import 'package:desafio/components/pages/moeda_base.dart';
import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';

String? selectedCoin; //talvez devesse ser global
bool selectedCoinTap = false;

class ConversionMain extends StatefulWidget {
  const ConversionMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ConversionMainState();
}

class ConversionMainState extends State<ConversionMain> {
  int currentPage = 0;
  String pageTitle = Strings.appBarTitle1;
  PageController pageController = PageController();
  bool allowScroll = true;

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

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  List<Widget> pages = [
    PageViewItem1(message: Strings.message1, pageTitle: Strings.appBarTitle1),
    PageViewItem2(
        message: Strings.message2('Dólar'), pageTitle: Strings.appBarTitle2),
    PageViewItem(
        message: Strings.message3('Euro'), pageTitle: Strings.appBarTitle3),
  ];

  void changeTitle() {
    setState(() {
      if (currentPage == 1) {
        pageTitle = Strings.appBarTitle2;
      } else if (currentPage == 2) {
        pageTitle = Strings.appBarTitle3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: pageController,
          onPageChanged: onPageChanged,
          scrollDirection: Axis.horizontal,
          //  allowImplicitScrolling: allowScroll,
          itemCount: pages.length,
          itemBuilder: (context, int index) {
            if (index > 0) {
              // allowScroll = false;
            }
            return pages[index];
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(pages.length, (int index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10,
                  width: 10,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == currentPage)
                          ? Colors.blueAccent
                          : Colors.grey),
                );
                onItemPressed(index);
              }),
            ),
          ],
        ),
      ],
    );
  }

  List<String> items = ['Dólar', 'Euro', 'Real'];

  Widget PageItemNew() {
    return Column(
      children: [
        Center(
          child: Text('anything'),
        ),

        /*ListView(
        children: [
          const Text('Testando'),
          ElevatedButton(onPressed: () {}, child: const Text('Trial')),
        ],
      ), */

        /* ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(
              items[index],
              style: TextStyle(color: Colors.white),
            )); /*,
              onTap: (int index) {
                // pagepageController.animateToPage(
                //   index,
                //   duration: const Duration(milliseconds: 400),
                //   curve: Curves.bounceInOut,
                // );
                setState(() {
                  currentPage = index;
                  pageController.jumpToPage(0);
                });
              //}(index));
              //},
            );
          }),*/
          },
        ),*/
      ],
    );
  }

  /*@override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }*/
}

class PageViewItem extends StatefulWidget {
  var message;
  var pageTitle;

  PageViewItem({Key? key, required this.message, required this.pageTitle})
      : super(key: key);

  @override
  State<PageViewItem> createState() =>
      _PageViewItemState(message: message, pageTitle: pageTitle);
}

class _PageViewItemState extends State<PageViewItem> {
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
        //componentizar - deixar isso aqui por fora de forma que um metodo mais acima passe como parametro o titulo
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

          /*ListView(
          children: [
            const Text('Testando'),
            ElevatedButton(onPressed: () {}, child: const Text('Trial')),
          ],
        ), /**/
         ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  items[index],
                  style: const TextStyle(color: Colors.white),
                ),
                 onTap: (int index) {
                  // pagepageController.animateToPage(
                  //   index,
                  //   duration: const Duration(milliseconds: 400),
                  //   curve: Curves.bounceInOut,
                  // );
                  setState(() {
                    currentPage = index;
                    pageController.jumpToPage(0);
                  });
                //}(index));
                //},
              );
              );
            }),*/
        ],
      ),
    );
    // }),
    // ],
    //);
  }
}

class CardCoin extends StatefulWidget {
  var name;

  CardCoin({Key? key, this.name}) : super(key: key);

  @override
  State<CardCoin> createState() => _CardCoinState();
}

class _CardCoinState extends State<CardCoin> {
  Color iconColor = ColorItems().gray;
  Color textColor = ColorItems().gray;
  bool tapOn = false;

  void onTapCardCoin() {
    setState(() {
      selectedCoin = widget.name;

      if (iconColor == ColorItems().gray && !selectedCoinTap) {
        selectedCoinTap = true;
        iconColor = ColorItems().blue;
        textColor = ColorItems().blue;
      } else {
        iconColor = ColorItems().gray;
        textColor = ColorItems().gray;
        selectedCoinTap = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.attach_money_sharp),
            title: Text(widget.name),
            enabled: true,
            //hoverColor: colorHover,
            iconColor: iconColor,
            textColor: textColor,
            //hoverColor: colorHover,
            //autofocus: true,
            onTap: onTapCardCoin,
          ),
        ],
      ),
    );
  }
}
