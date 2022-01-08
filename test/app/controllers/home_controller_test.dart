import 'dart:convert';

import 'package:conversor/app/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(fromText: fromText, toText: toText);

  test('Converte real para dólar', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0,36');
  });
}
