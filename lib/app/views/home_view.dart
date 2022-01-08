// ignore_for_file: prefer_const_constructors

import 'package:conversor/app/components/currency_box.dart';
import 'package:conversor/app/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController toText = TextEditingController();
  late HomeController homeController;
  late final TextEditingController fromText = TextEditingController();

  @override
  void initState() {
    homeController = HomeController(toText: toText, fromText: fromText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
              child: ListView(
                children: [
                  Image.asset(
                    'assets/logoDaSilva.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CurrencyBox(
                    selectedItem: homeController.toCurrency,
                    controller: toText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.toCurrency = model!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CurrencyBox(
                    selectedItem: homeController.fromCurrency,
                    controller: fromText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.fromCurrency = model!;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 22))),
                      child: Text('Converter'),
                      onPressed: () {
                        homeController.convert();
                      })
                ],
              ),
            )));
  }
}
