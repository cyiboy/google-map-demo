

import 'app/data/dtos/responses.dart';
import 'app/data/services/location_result.dart';

class RequestRepository{
  static locationResult _result = locationResult();

  static Future<Responses> getLoaction(String input) async {
    final response = await _result.getSuggestion(input);
    return  response;
  }

}