import 'package:flutter/material.dart';
import '../core/appbar.dart';

class GeneralLeadRaports extends StatefulWidget {
  const GeneralLeadRaports({super.key});

  @override
  State<GeneralLeadRaports> createState() => _GeneralLeadRaportsState();
}

class _GeneralLeadRaportsState extends State<GeneralLeadRaports> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SpecialAppBar(),
      body: Center(
        child: SingleChildScrollView(),
      ),
    );
  }
}
