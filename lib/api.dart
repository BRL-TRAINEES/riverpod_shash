
import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiService {

  Future<double> fetch() async{
    final response= await http.get(Uri.parse('https://v6.exchangerate-api.com/v6/71478dfdd9bb2533b494ba46/latest/USD'));
    if(response.statusCode==200){
    final data=jsonDecode(response.body);
    return data['conversion_rates']['INR'];}
    else{
      throw Exception('Failed to fetch data');
    }


  }}