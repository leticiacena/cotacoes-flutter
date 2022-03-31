import 'package:desafio/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:desafio/resources/strings.dart';

String? selectedCoin; //talvez devesse ser global
bool selectedCoinTap = false;

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
      margin: const EdgeInsets.all(12),
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
