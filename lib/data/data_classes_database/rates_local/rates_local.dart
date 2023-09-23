import 'package:isar/isar.dart';

part 'rates_local.g.dart';

@collection
class RatesLocal{
  Id id = Isar.autoIncrement;

  String? name;

  double? currentRate;
}