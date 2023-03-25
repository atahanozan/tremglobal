import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tremglobal/core/appbar.dart';
import 'package:tremglobal/core/lists.dart';

class GeneralAdvisorsPage extends StatefulWidget {
  const GeneralAdvisorsPage({Key? key}) : super(key: key);

  @override
  State<GeneralAdvisorsPage> createState() => _GeneralAdvisorsPageState();
}

class _GeneralAdvisorsPageState extends State<GeneralAdvisorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpecialAppBar(),
      body: ListView.builder(
        itemCount: advisorInfoLists.investmenAdvisors.length,
        itemBuilder: (context, index) {
          var result = advisorInfoLists.investmenAdvisors[index];
          var ikinci = advisorInfoLists.depts[index];
          return ListTile(
            title: Text(
              result,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text("$ikinci Dil Grubu"),
            leading: Image.network("https://picsum.photos/200"),
          );
        },
      ),
    );
  }
}
