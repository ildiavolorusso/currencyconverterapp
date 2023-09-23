import 'package:json_annotation/json_annotation.dart';

part 'available_currencies.g.dart';

@JsonSerializable()
class AvailableCurrencies{

AvailableCurrencies({
    required this.success,
    required this.currencies
});

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'symbols')
  Map<String, String> currencies;


factory AvailableCurrencies.fromJson(var json) => _$AvailableCurrenciesFromJson(json);

Map<String, dynamic> toJson() => _$AvailableCurrenciesToJson(this);
}