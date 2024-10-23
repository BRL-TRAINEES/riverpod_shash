import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_1/api.dart';

final apiService = ApiService();
final currencyProvider = FutureProvider<double>((ref) async {
  return await apiService.fetch();
});

final TextEditingController uscon = TextEditingController();

class CurrencyConvert extends ConsumerWidget {
  CurrencyConvert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyValue=ref.watch(currencyProvider);

    return Scaffold(
              backgroundColor: Color.fromARGB(255, 80, 79, 79),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 46, 46),
        title: const Text('USD to INR Converter',style: TextStyle(color: Colors.grey),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

            const SizedBox(height: 215),
            TextField(
              controller:uscon,
              decoration:InputDecoration(
              labelText: 'Enter amount in USD',   labelStyle: TextStyle(color: Color(0xFFFFFFFF)),
                   border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                 
                ),
                filled: true,
                fillColor: Color.fromRGBO(30, 30, 30, 1),
              ),
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), 
            )
            ]),
          ));}}