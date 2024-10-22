import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_1/api.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrencyConvert(),
    );
  }
}
final currencyProvider = FutureProvider<double>((ref) async {
  final apiService = ApiService();
  return await apiService.fetch();
});

class CurrencyConvert extends ConsumerWidget {
  const CurrencyConvert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyAsyncValue = ref.watch(currencyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('USD to INR Converter'),
      ),
      body: Center(
        child: currencyAsyncValue.when(
          data: (rate) => Text(
            '1 USD = $rate INR',
            style: const TextStyle(fontSize: 24),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }
}


