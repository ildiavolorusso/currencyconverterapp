import 'package:json_annotation/json_annotation.dart';

part 'rates.g.dart';

@JsonSerializable()
class Rates{

  Rates({
    required this.success,
    required this.rates
  });

  @JsonKey(name: 'success')
  bool success;
  @JsonKey(name: 'rates')
  Map<String, double> rates;


  factory Rates.fromJson(var json) => _$RatesFromJson(json);

  Map<String, dynamic> toJson() => _$RatesToJson(this);
}