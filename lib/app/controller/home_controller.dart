import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double total = 0;

    switch (fromCurrency.name) {
      case 'Real':
        total = value * toCurrency.real;
        break;
      case 'Dolar':
        total = value * toCurrency.dolar;
        break;
      case 'Euro':
        total = value * toCurrency.euro;
        break;
      case 'Bitcoin':
        total = value * toCurrency.bitcoin;
        break;
      default:
        'ERROR';
    }

    fromText.text = total.toStringAsFixed(2);
  }
}
