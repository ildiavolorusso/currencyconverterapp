import 'package:currencyconverterapp/data/const/api_const.dart';
import 'package:currencyconverterapp/data/data_classes_api/available_currencies/available_currencies.dart';
import 'package:dio/dio.dart';

import '../data_classes_api/rates/rates.dart';

class ApiServices{

  Dio dio = Dio(BaseOptions(baseUrl: ApiConst.BASE_URL));

  Future<Map<int?, AvailableCurrencies?>> getAvailableCurrencies() async {
    try {
      Response response;
      response = await dio.get(
          '/symbols', queryParameters: {'access_key': ApiConst.API_KEY});
        AvailableCurrencies availableCurrencies = AvailableCurrencies.fromJson(response.data);
        return {response.statusCode : availableCurrencies};
    } on DioException catch(e) {
      return {e.response?.statusCode : null};
    }
  }

  Future<Map<int?, Rates?>> getRates(String base, String? symbols) async {
    try {
      Response response;
      response = await dio.get(
          '/latest', queryParameters: {'access_key': ApiConst.API_KEY, 'base' : base, 'symbols' : symbols});
        Rates rates = Rates.fromJson(response.data);
        return {response.statusCode : rates};
    } on DioException catch(e) {
      return {e.response?.statusCode : null};
    }
  }

}