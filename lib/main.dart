import 'package:flutter/material.dart';
/// Flutter code sample for [SearchBar].

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // @override
  // State<MyApp> createState() => _MyAppState();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: const Searchbar(title: 'News App'),
      );
  }

}
