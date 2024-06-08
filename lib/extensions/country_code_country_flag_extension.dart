import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:equatable/equatable.dart";



class Person {
  final String name;
  final int age;
  const Person({required this.name, required this.age});

}
class CountryCodeToFlagExtension extends StatelessWidget {
  const CountryCodeToFlagExtension({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Person bob =  const Person(name: "Bob", age: 40);
           Person bob1 = const Person(name: "Bob", age: 40);

        },
      ),
      appBar: AppBar(
        title: const Text('Flag Extension'),
      ),
      body: Center(
          child: Text("IND".toFlag.toString(), style:  const TextStyle(fontSize: 50),)),
    );
  }
}


extension ConvertFlag on String {
  String get toFlag {

    return  (this).toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }
}