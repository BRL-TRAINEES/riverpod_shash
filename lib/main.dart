import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(const ProviderScope(
  
  
  child:MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   
    
      home: HomePage(),
    );
  }
}
final currentDate=Provider<DateTime>((ref)=>DateTime.now());

class HomePage extends ConsumerWidget{
  HomePage ({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context,WidgetRef ref){

    final date=ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white , 
  
        title:Text('HomePage',style: TextStyle(color: Colors.black),),),

        body:Center(
        child: Text(date.toString()),),
      );
 
  }
  }


