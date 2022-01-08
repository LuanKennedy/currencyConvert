import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  late final List<CurrencyModel> items;
  late final CurrencyModel selectedItem;
  late final TextEditingController controller;
  late final void Function(CurrencyModel? model)? onChanged;

  CurrencyBox(
      {Key? key,
      required this.items,
      required this.controller,
      required this.selectedItem,
      required this.onChanged})
      : super(key: key);

  String dropdownValue = 'Real';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SizedBox(
          height: 57,
          // ignore: prefer_const_literals_to_create_immutables
          child: DropdownButton<CurrencyModel>(
            isExpanded: true,
            value: selectedItem,
            icon: const Icon(Icons.account_balance),
            elevation: 16,
            style: const TextStyle(color: Colors.green),
            underline: Container(
              height: 2,
              color: Colors.greenAccent,
            ),
            items: items
                .map((e) => DropdownMenuItem<CurrencyModel>(
                      value: e,
                      child: Text(e.name),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        )),
        SizedBox(
          width: 15,
        ),
        Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreenAccent))),
            ))
      ],
    );
  }
}
