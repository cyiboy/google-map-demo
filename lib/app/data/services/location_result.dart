import 'dart:convert';




import 'package:flutter_map/app/core/utils/constants.dart';
import 'package:flutter_map/app/data/dtos/responses.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
 class locationResult{
   var uuid = new Uuid();
   late String _sessionToken ;
   late Responses _responses;
   Future<Responses> getSuggestion(String input) async {
     _sessionToken = uuid.v4() ;
     String kPLACES_API_KEY =  GOOGLE_MAPS_API_KEY;
     String type = '(regions)';
     String baseURL =
         'https://maps.googleapis.com/maps/api/place/autocomplete/json';
     var request =
         '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
     var response = await http.get(Uri.parse(request));
     if (response.statusCode == 200) {

       _responses = Responses(message: 'succesfull', data: json.decode(response.body)['predictions'], status: 200);

     } else {
       throw Exception('Failed to load predictions');
     }
     return _responses;
   }

 }