import 'package:desafio/blocs/bloc.dart';
import 'package:desafio/blocs/conversion_state.dart';
import 'package:desafio/components/pages/cotacao.dart';
import 'package:desafio/components/pages/moeda_base.dart';
import 'package:desafio/components/pages/resultado.dart';
import 'package:desafio/models/enum.dart';
import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversionMain extends StatefulWidget {
  const ConversionMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ConversionMainState();
}

class ConversionMainState extends State<ConversionMain> {
  late final ConversionBloc _bloc;
  var results;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ConversionBloc>();
    _bloc.getScreenCoins();
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversionBloc, CoinMainState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CoinState) {
            return Stack(
              children: <Widget>[
                PageView(
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),

                  //  allowImplicitScrolling: allowScroll,
                  children: [
                    BaseCoinPage(
                        coinsList: state.coinsList,
                        alteredList: _bloc.alteredList,
                        baseCoin: _bloc.baseCoin,
                        jumpToPage: pageController),
                    SelectCotationPage(
                      alteredList: _bloc.alteredList,
                      baseCoin: _bloc.baseCoin,
                      selectedCoins: _bloc.selectedCoins,
                      //conversions: _bloc,
                      jumpToPage: pageController,
                    ),

                    ResultPage(
                      baseCoin: _bloc.baseCoin,
                      coinsList: _bloc.selectedCoins,
                      //results: _bloc.conversions,
                      conversionBloc: _bloc,
                      //t: _bloc.getScreenCoins(),
                      //,
                      //stateResult: state is ConversionShowState,
                    ),
                    //ResultPage(coinsList: state.filteredList),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(3, (int index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == currentPage)
                                  ? ColorItems().blue
                                  : Colors.grey),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            );
          } else {
            if (state is ConversionShowState) {
              return ResultPage(
                baseCoin: _bloc.baseCoin,
                coinsList: _bloc.selectedCoins,
                //results: _bloc.conversions,
                conversionBloc: _bloc,
                //t: _bloc.getScreenCoins(),
                //,
                //stateResult: state is ConversionShowState,
              );
            }
            throw CoinsApiError();
          }
        });
  }
}

/*Código mantido apenas para fins de estudos/testes
Entretanto daqui em diante não foi mais utilizado*/

class PageViewScreen extends StatefulWidget {
  final String message;
  final String pageTitle;
  final int pageIndex;

  const PageViewScreen(
      {Key? key,
      required this.message,
      required this.pageTitle,
      required this.pageIndex})
      : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final list = ['BRL', 'EUR', 'BTC'];

  late final ConversionBloc _bloc2;
  var results;

  @override
  void initState() {
    super.initState();
    _bloc2 = context.read<ConversionBloc>();
    _bloc2.getScreenCoins();
  }

  int currentPage = 0;
  PageController pageController = PageController();

  void onItemPressed(int index) {
    // pagepageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 400),
    //   curve: Curves.bounceInOut,
    // );
    /* setState(() {
      currentPage = index;
      pageController.jumpToPage(1);
    });*/
  }

  //Com Listview

  List<Color> iconColor = [
    ColorItems().gray,
    ColorItems().gray,
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
    ColorItems().gray,
    ColorItems().gray,
    ColorItems().gray
  ];

  bool tapOn = false;
  var cont;
  //debugPrint(pageIndex);

  String? selectedCoin;
  List<String> selectedCoins = [];

  onTapListTileCoin(int index, int page) {
    //cont++;
    setState(() {
      // selectedCoin = widget.name;
      //controle de index

      switch (page) {
        case 0:
          if (cont == 0) {
            tapOnOff(index);
            //   _bloc2.selectedCoin = Strings.moedas[index];
            //selectedCoin = Strings.moedas[index];

          } else {
            cont++;
          }

          //print(page);
          break;

        case 1: //lista de moedas
          //     _bloc2.selectedCoins.add(Strings.moedas[index]);
          break;

        case 2:
          break;
      }
    });
  }

  void tapOnOff(int index) {
    if (iconColor[index] == ColorItems().gray &&
        textColor[index] == ColorItems().gray) {
      // selectedCoinTap = true;

      iconColor[index] = ColorItems().blue;
      textColor[index] = ColorItems().blue;
    } else {
      iconColor[index] = ColorItems().gray;
      textColor[index] = ColorItems().gray;
      //  selectedCoinTap = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //componentizar - deixar isso aqui por fora de forma que um metodo mais acima passe como parametro o titulo
        title: Text(
          widget.pageTitle,
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
          Expanded(
            child: ListView.builder(
              itemCount: Strings.moedas.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: iconColor[index],
                    )),
                    child: ListTile(
                      selectedColor: ColorItems().blue,
                      enabled: true,
                      leading: const Icon(Icons.attach_money_sharp),
                      //hoverColor: colorHover[],
                      iconColor: iconColor[index],
                      textColor: textColor[index],
                      trailing: Text(results[index]
                          .value
                          .toString()), //- vou passar isso quando for a tela 2

                      title: Text(
                        Strings.moedas[index],
                      ),
                      onTap: () => onTapListTileCoin(index, widget.pageIndex),
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
