import 'package:flutter/material.dart';
import 'package:tremglobal/core/appbar.dart';

class SalesReorts extends StatefulWidget {
  const SalesReorts({Key? key}) : super(key: key);

  @override
  State<SalesReorts> createState() => _SalesReortsState();
}

class _SalesReortsState extends State<SalesReorts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpecialAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Satış Raporları",
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
