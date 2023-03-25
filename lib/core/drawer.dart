import 'package:flutter/material.dart';
import 'package:tremglobal/projectpages/advisorspage.dart';
import 'package:tremglobal/projectpages/advisorsreports.dart';
import 'package:tremglobal/projectpages/generalleadreports.dart';
import 'package:tremglobal/projectpages/homepage.dart';
import 'package:tremglobal/projectpages/salesreports.dart';
import 'package:tremglobal/projectpages/tourreports.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

// Tüm sayfalarda kullanılabilecek özel tasarlanmış Drawer sayfası.

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: Colors.deepOrange.shade600),
            child: const FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "TREM \nGLOBAL",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const _listTileDrawer(
            text1: 'Ana Sayfa',
            page: HomePage(),
          ),
          const _listTileDrawer(
            text1: 'Yatırım Danışmanları',
            page: GeneralAdvisorsPage(),
          ),
          const _listTileDrawer(
            text1: 'Genel Lead Raporu',
            page: GeneralLeadRaports(),
          ),
          const _listTileDrawer(
            text1: 'Tur Raporu',
            page: TourReports(),
          ),
          const _listTileDrawer(
            text1: 'Satış Raporu',
            page: SalesReorts(),
          ),
          const _listTileDrawer(
            text1: 'Yatırım Danışmanı Performansı',
            page: AdvisorReports(),
          ),
        ],
      ),
    );
  }
}

class _listTileDrawer extends StatelessWidget {
  const _listTileDrawer({Key? key, required this.text1, this.page})
      : super(key: key);
  final String text1;
  final page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      title: Text(text1,
          style:
              Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16)),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 15,
      ),
    );
  }
}
