//import 'dart:html';

import 'package:desafio/blocs/conversion_state.dart';
import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc.dart';
import '../../models/enum.dart';

class ResultPage extends StatefulWidget {
  final List<String> coinsList;
  List<String> baseCoin;
  //var results;
  Object? stateResult;
  ConversionBloc conversionBloc;
  var t;

  ResultPage(
      {Key? key,
      required this.coinsList,
      required this.baseCoin,
      //required this.results,
      required this.conversionBloc,
      this.stateResult,
      this.t})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  //late final ConversionBloc _bloc2;
  //var results2;

  @override
  void initState() {
    super.initState();
    //_bloc2 = context.read<ConversionBloc>();
    //widget.results = _bloc2.getScreenCoins();
    //widget.
    // _bloc2 = widget.t;
    // print('&*&*results: ${widget.results.first}');
    //print('teste: *** ${widget.results.first}');
    //_bloc2.getScreenCoins();
    widget.conversionBloc.getScreenCoins();
  }

  int currentPage = 0;
  PageController pageController = PageController();
  //Color colorCotation =  result[index]<1 - verde, >1 e <5 amarelo,
  //>5 vermelho

  Color colorCotation(double cotation) {
    if (cotation < 1) {
      return ColorItems().green;
    } else if (cotation > 1 && cotation < 5) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //componentizar - deixar isso aqui por fora de forma que um metodo mais acima passe como parametro o titulo
        title: const Text(
          Strings.appBarTitle3,
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(31, 93, 93, 93),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              Strings.message3(widget.baseCoin.first),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.coinsList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  //if ( is ConversionShowState) {}

                  //print(widget.results);
                  //widget.conversionBloc.getScreenCoins();

                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: ColorItems().darkGray,
                      )),
                      child: ListTile(
                        selectedColor: ColorItems().blue,
                        enabled: true,
                        leading: const Icon(Icons.attach_money_sharp),
                        trailing: Text(
                          //widget.results[index]
                          //.conversions[index].value.toString(),
                          //widget.t[index].value.toString(),

                          // widget.results[index].value.toString(),
                          widget.conversionBloc.conversions[index].value
                              .toString(),
                          style: TextStyle(
                              color: colorCotation(widget
                                  .conversionBloc.conversions[index].value)),
                        ),
                        title: Text(
                          widget.coinsList[index],
                          style: TextStyle(color: ColorItems().gray),
                        ),
                      ),
                    ),
                  );
                }),
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
                dispose();
              },
              child: const Text(
                Strings.done,
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
