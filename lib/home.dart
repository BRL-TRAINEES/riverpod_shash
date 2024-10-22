import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_1/api.dart';




 final apiService = ApiService();
final currencyProvider = FutureProvider<double>((ref) async {
 return await apiService.fetch();
});



class CurrencyConvert extends StatelessWidget {
  const CurrencyConvert({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar( title:Text('HomePage'),backgroundColor: Colors.grey,),


    );
  }
}