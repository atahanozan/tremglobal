import 'package:flutter/material.dart';
import 'package:tremglobal/core/advisors_cards.dart';
import 'package:tremglobal/core/appbar.dart';
import 'package:tremglobal/core/general_reports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SpecialAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AdvisorCards(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.orange.shade50,
                  thickness: 3,
                ),
              ),
              GeneralReports(),
            ],
          ),
        ),
      ),
    );
  }
}
