import 'package:flutter/material.dart';

import '../core/appbar.dart';

class AdvisorReports extends StatefulWidget {
  const AdvisorReports({super.key});

  @override
  State<AdvisorReports> createState() => _AdvisorReportsState();
}

class _AdvisorReportsState extends State<AdvisorReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpecialAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Yatırım Danışmanı Performansı",
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
