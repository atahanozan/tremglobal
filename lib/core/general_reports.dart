import 'package:flutter/material.dart';
import 'package:tremglobal/languages/textutilities.dart';
import 'package:tremglobal/projectpages/advisorsreports.dart';
import 'package:tremglobal/projectpages/generalleadreports.dart';
import 'package:tremglobal/projectpages/salesreports.dart';
import 'package:tremglobal/projectpages/tourreports.dart';

class GeneralReports extends StatefulWidget {
  const GeneralReports({Key? key}) : super(key: key);

  @override
  State<GeneralReports> createState() => _GeneralReportsState();
}

class _GeneralReportsState extends State<GeneralReports> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text("RAPORLAR", style: Theme.of(context).textTheme.headline5),
        ),
        _listTile(
          text1: 'Genel Lead Raporu',
          text2: projectTextUtilities.greportssubtitle1,
          page: const GeneralLeadRaports(),
        ),
        _listTile(
          text1: "Tur Raporu",
          text2: projectTextUtilities.greportssubtitle2,
          page: const TourReports(),
        ),
        _listTile(
          text1: "Satış Raporu",
          text2: projectTextUtilities.greportssubtitle3,
          page: const SalesReorts(),
        ),
        _listTile(
          text1: "Yatırım Danışmanı Performansı",
          text2: projectTextUtilities.greportssubtitle4,
          page: const AdvisorReports(),
        )
      ],
    );
  }
}

class _listTile extends StatelessWidget {
  const _listTile(
      {Key? key, required this.text1, required this.text2, this.page})
      : super(key: key);
  final String text1;
  final String text2;
  final page;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              text1,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 25, color: Colors.deepOrange.shade200),
            ),
          ),
          subtitle: Text(text2),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(),
        ),
      ],
    );
  }
}
