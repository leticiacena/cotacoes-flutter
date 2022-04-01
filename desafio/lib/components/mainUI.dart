import 'package:desafio/components/pages/cotacao.dart';
import 'package:desafio/components/pages/moeda_base.dart';
import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';

String selectedCoin = ''; //talvez devesse ser global
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

  static get pageIndex => null;

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  List<Widget> pages = [
    PageViewScreen(
        message: Strings.message1,
        pageTitle: Strings.appBarTitle1,
        pageIndex: 0),
    PageViewScreen(
        message: Strings.message2(selectedCoin),
        pageTitle: Strings.appBarTitle2,
        pageIndex: 1),
    PageViewScreen(
        message: Strings.message3('Euro'),
        pageTitle: Strings.appBarTitle3,
        pageIndex: 2),
  ];

  void changeTitle() {
    setState(() {});
  }

  void onPressed() {
    //checar se algo foi selecionado
    //pular para a proxima pagina
  }

  String buttonTitle = pageIndex == 1 ? Strings.done : Strings.prox;

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
              //a implementar
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
              }),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: Text(
              buttonTitle,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class PageViewScreen extends StatefulWidget {
  var message;
  var pageTitle;
  var pageIndex;

  PageViewScreen(
      {Key? key,
      required this.message,
      required this.pageTitle,
      required this.pageIndex})
      : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState(
      message: message, pageTitle: pageTitle, pageIndex: pageIndex);
}

class _PageViewScreenState extends State<PageViewScreen> {
  var message;
  var pageTitle;
  var pageIndex;

  _PageViewScreenState(
      {required this.message,
      required this.pageTitle,
      required this.pageIndex});

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

  //Com Listview

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
  var cont;

  onTapListTileCoin(int index) {
    //cont++;
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
          /*CardCoin(name: Strings.real),
          CardCoin(name: Strings.libra),
          CardCoin(name: Strings.ester),
          CardCoin(name: Strings.dolar),
          CardCoin(name: Strings.peso),
          CardCoin(name: Strings.iene),*/
          /*Expanded(
            child: ListView.builder(
              itemCount: Strings.moedas.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    leading: const Icon(Icons.attach_money_sharp),
                    enabled: true,
                    //hoverColor: colorHover,
                    //iconColor: iconColor[index],
                    //   textColor: textColor[index],
                    title: Text(
                      Strings.moedas[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: onTapListTileCoin(index),
                  ),
                );
              },
            ),
          ),*/
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
  var pageIndex;

  CardCoin({Key? key, this.name, this.pageIndex}) : super(key: key);

  @override
  State<CardCoin> createState() => _CardCoinState();
}

class _CardCoinState extends State<CardCoin> {
  Color iconColor = ColorItems().gray;
  Color textColor = ColorItems().gray;
  bool tapOn = false;
  bool enabled = true;

  void onTapCardCoin() {
    setState(() {
      Strings().selectedCoin(widget.name);
      enabled = false;
      if (iconColor == ColorItems().gray) {
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
            enabled: enabled,
            //hoverColor: colorHover,
            //shape: ShapeBorder.lerp(ShapeBorder().paint(canvas, rect), , 4),
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
