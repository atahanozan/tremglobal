import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tremglobal/languages/textutilities.dart';
import 'package:tremglobal/projectpages/addadvisor.dart';
import 'package:tremglobal/service/advisors_service.dart';

class SpecialAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SpecialAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<SpecialAppBar> createState() => _SpecialAppBarState();
}

// Appbar için genel özelliklerin tanımlandığı özel AppBar sayfası

class _SpecialAppBarState extends State<SpecialAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'trem',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            Text(
              'global',
              style: TextStyle(color: Colors.orange.shade900, fontSize: 30),
            )
          ],
        ),
      ),
      actions: [
        InkWell(
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: explainCard()));
            },
            child: const Icon(Icons.info_rounded)),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddAdvisorPageView()));
          },
          icon: const Icon(
            Icons.group_add_rounded,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

//Uygulama bilgilerini içeren yazı butonu
class explainCard extends StatelessWidget {
  const explainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        projectTextUtilities.homepageexplain,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ));
  }
}
