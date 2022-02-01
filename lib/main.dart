import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const TipApp());
}

class TipApp extends StatelessWidget {
  const TipApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tips',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip calc'),
      ),
      body: ListView(
        children: const [
          Bill(),
        ],
      ),
    );
  }
}

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  final billController = TextEditingController();
  String _bill = "";

  @override
  void initState() {
    super.initState();

    billController.addListener(_setBill);
  }

  void _setBill() {
    setState(() {
      _bill = double.parse(billController.text).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            textAlign: TextAlign.right,
            controller: billController,
            keyboardType: TextInputType.number,
          ),
          Text(_bill.toString())
        ],
      ),
    );
  }
}
