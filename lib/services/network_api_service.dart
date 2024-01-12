import 'dart:convert';
import 'dart:io';

import 'package:rest_api/services/app_exceptions.dart';
import 'package:rest_api/services/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("No Internet");
    } on RequestTimeOutExceptions {
      throw RequestTimeOutExceptions("Time Out");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseBody = jsonDecode(response.body);
        return responseBody ;
      case 400:
         throw InvalidUrlExceptions ;

         default:
           throw FetchDataExceptions(response.statusCode.toString()) ;


    }
  }
}
