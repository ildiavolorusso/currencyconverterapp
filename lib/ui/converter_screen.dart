import 'package:currencyconverterapp/data/api_services/api_services.dart';
import 'package:currencyconverterapp/data/data_classes_database/rates_local/rates_local.dart';
import 'package:currencyconverterapp/data/database_services/database_services.dart';
import 'package:currencyconverterapp/data/const/locale_strings.dart';
import 'package:currencyconverterapp/logic/calculation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../data/data_classes_api/available_currencies/available_currencies.dart';
import '../data/data_classes_api/rates/rates.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<StatefulWidget> createState() => ConverterScreenState();
}

class ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _sendController = TextEditingController();
  final TextEditingController _getController = TextEditingController();

  final List<DropdownMenuItem<String>> _availableCurrenciesList =
      List.empty(growable: true);

  String? _selectedSendValue;

  String? _selectedGetValue;

  bool isLoading = true;

  DatabaseServices databaseServices = DatabaseServices();

  @override
  void initState() {
    super.initState();
    databaseServices.initDatabase();
    getAvailableCurrencies();
  }

  //получение списка доступных валют
  void getAvailableCurrencies() async {
    _availableCurrenciesList.clear();
    Map<int?, AvailableCurrencies?> response =
        await ApiServices().getAvailableCurrencies();
    //интернет-соединение есть или данные успешно обновлены
    if (response.entries.single.value != null) {
        for (var element in response.entries.single.value!.currencies.keys) {
          _availableCurrenciesList
              .add(DropdownMenuItem(value: element, child: Text(element)));
        }
        databaseServices.writeAvailableCurrencies(
            response.entries.single.value!.currencies.keys.toList());
      } else {
      //нет подключения или от сервера пришла ошибка
      showError(response.entries.single.key);
      getLocalAvailableCurrencies();
    }
    setState(() {
      isLoading = false;
    });
  }

  void getLocalAvailableCurrencies() async {
    List<RatesLocal> ratesLocal =
    await databaseServices.readAvailableCurrencies();
    for (var element in ratesLocal) {
      _availableCurrenciesList.add(
          DropdownMenuItem(value: element.name, child: Text(element.name!)));
    }
  }

  //получение списка ставок
  void getRates() async {
    Map<int?, Rates?> response =
        await ApiServices().getRates(_selectedSendValue!, _selectedGetValue);
    //интернет-соединение есть или данные успешно обновлены
    if (response.entries.single.value != null) {
      double currentRate = response.entries.single.value!.rates.entries
          .firstWhere((element) => element.key == _selectedGetValue)
          .value;
      //текущая ставка для выбранных валют сохранена
      databaseServices.updateRateForCurrency(_selectedGetValue!, currentRate);
      _getController.text = Calculation(sendValue: double.parse(_sendController.text), rate: currentRate).getResult().toString();
    } else {
      //нет подключения или от сервера пришла ошибка
      _getController.clear();
      showError(response.entries.single.key);
    }
  }

  showError(int? errorCode) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        errorCode == null ? LocaleStrings.unexpectedErrorLabel : LocaleStrings.errorCodeLabel + errorCode.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(LocaleStrings.appTitle),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: (MediaQuery.of(context).size.width / 1.5) - 32,
                          child: TextField(
                            onChanged: (amount) {
                              if(_sendController.text.isEmpty){
                                _getController.clear();
                              } else if(_selectedSendValue != null && _selectedGetValue != null){
                                getRates();
                              }
                            },
                            controller: _sendController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: LocaleStrings.youSendLabel),
                          )),
                      const Spacer(),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: DropdownButton(
                              value: _selectedSendValue,
                              items: _availableCurrenciesList,
                              onChanged: (selectedValue) {
                                setState(() {
                                  _selectedSendValue = selectedValue;
                                });
                                if(_selectedGetValue != null && _sendController.text.isNotEmpty) {
                                  getRates();
                                }
                              }))
                    ],
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                      onTap: () {
                        String? temp;
                        setState(() {
                          temp = _selectedSendValue;
                          _selectedSendValue = _selectedGetValue;
                          _selectedGetValue = temp;
                        });
                        getRates();
                      },
                      child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Transform.rotate(
                              angle: math.pi / 2,
                              child:
                                  const Icon(Icons.compare_arrows_outlined)))),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                          width: (MediaQuery.of(context).size.width / 1.5) - 32,
                          child: TextField(
                            enabled: false,
                            controller: _getController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: LocaleStrings.theyGetLabel),
                          )),
                      const Spacer(),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: DropdownButton(
                              value: _selectedGetValue,
                              items: _availableCurrenciesList,
                              onChanged: (selectedValue) {
                                setState(() {
                                  _selectedGetValue = selectedValue;
                                });
                                if(_selectedSendValue != null && _sendController.text.isNotEmpty) {
                                  getRates();
                                }
                              }))
                    ],
                  ),
                ],
              )),
    );
  }
}
