// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_currencies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableCurrencies _$AvailableCurrenciesFromJson(Map<String, dynamic> json) =>
    AvailableCurrencies(
      success: json['success'] as bool,
      currencies: Map<String, String>.from(json['symbols'] as Map),
    );

Map<String, dynamic> _$AvailableCurrenciesToJson(
        AvailableCurrencies instance) =>
    <String, dynamic>{
      'success': instance.success,
      'symbols': instance.currencies,
    };
