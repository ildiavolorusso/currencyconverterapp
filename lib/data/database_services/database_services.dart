import 'package:currencyconverterapp/data/data_classes_database/rates_local/rates_local.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseServices{

  late Isar isar;

  initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [RatesLocalSchema],
      directory: dir.path,
    );
  }

  writeAvailableCurrencies(List<String> currencies) async {
   for(int i = 0; i < currencies.length; i++) {
      final newRate = RatesLocal()..id = i
        ..name = currencies[i]
        ..currentRate = null;
      await isar.writeTxn(() async {
        await isar.ratesLocals.put(newRate);
      });
    }
  }

  updateRateForCurrency(String currency, double rate) async {
    await isar.writeTxn(() async {
      final updatedCurrency = await isar.ratesLocals.filter().nameEqualTo(currency).findFirst();
      final newRate = RatesLocal()..id = updatedCurrency!.id
        ..name = currency
        ..currentRate = rate;
      await isar.ratesLocals.put(newRate);
    });
  }

  Future<List<RatesLocal>> readAvailableCurrencies() async {
    final rates = isar.ratesLocals.filter().nameIsNotNull().findAll();
    return rates;
  }

}