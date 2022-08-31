// ignore_for_file: avoid_types_as_parameter_names

import 'dart:convert';

import 'package:http/http.dart';

import '../models/pokeapi/response_base.dart';

class HttpService {
  late String _apiUrl;
  // late String _serviceUrl;
  // late String? _serviceApiUrl;
  // final SecureService _secureService = Injector().get<SecureService>();

  HttpService() {
    _apiUrl = 'https://pokeapi.co/api/v2/';
    // _serviceUrl = FlutterConfig.get('SERVICES_URL') as String;
    // _serviceApiUrl = FlutterConfig.get('SERVICES_API_URL') as String?;
  }

  /// Request in GET
  Future<ResponseBase> httpGet(String url, bool) async {
    var uri = Uri.parse(bool?_apiUrl+url: url);
    ResponseBase responseBase = ResponseBase();
    
    Response response = await get(uri);
    if (response.statusCode == 401) {
    } else if (response.statusCode == 200) {
      responseBase.success = true;
      responseBase.data = response.body.toString();
    } else {
      responseBase.success = false;
      responseBase.errorMessage = jsonDecode(response.body)['error']['message'];
    }
    return responseBase;
  }



}