// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rates _$RatesFromJson(Map<String, dynamic> json) => Rates(
      success: json['success'] as bool,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$RatesToJson(Rates instance) => <String, dynamic>{
      'success': instance.success,
      'rates': instance.rates,
    };
