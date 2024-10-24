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
  final convertedProvider = StateProvider<double>((ref) => 0.0);
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyValue=ref.watch(currencyProvider);
        final convertedAmount = ref.watch(convertedProvider);


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
            

            currencyValue.when(
           data: (fetchedINR) => Text('Currently: 1 USD = $fetchedINR INR',style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            loading: () =>CircularProgressIndicator(),
             error: (error, stack) => Text('Error fetching rate',style: TextStyle(color: Colors.red),
  ),
),

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
            ),//end of textfield--

            SizedBox(height:10),
            
            ElevatedButton(
              style:ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                double usd =double.parse(uscon.text);               
               double fetchedINR = 1; 

                if (currencyValue.hasValue) {
                fetchedINR = currencyValue.value!; 
                  }

                 
                 double convertedAmount = usd * fetchedINR;
                ref.read(convertedProvider.notifier).state = convertedAmount; //works similiAR to  setstate


              },
              child: Text('Convert',style:TextStyle(color: const Color.fromARGB(255, 72, 41, 132))),
            ),
            SizedBox(height: 20),
            Text('Converted Amount: ${convertedAmount} INR', style: TextStyle(color: Colors.white)),
            ]
            
            
            ),
          ));
          }}