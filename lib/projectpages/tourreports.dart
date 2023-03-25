import 'package:flutter/material.dart';

import '../core/appbar.dart';

class TourReports extends StatefulWidget {
  const TourReports({super.key});

  @override
  State<TourReports> createState() => _TourReportsState();
}

class _TourReportsState extends State<TourReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpecialAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Tur Raporları",
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
