import 'package:flutter/material.dart';

class DepartmentLists extends StatefulWidget {
  const DepartmentLists({Key? key}) : super(key: key);

  @override
  State<DepartmentLists> createState() => _DepartmentListsState();
}

class _DepartmentListsState extends State<DepartmentLists> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: const [
          deptButton(
            name: 'Arabic',
          ),
          deptButton(
            name: 'English',
          ),
          deptButton(
            name: 'Persian',
          ),
          deptButton(
            name: 'Russian',
          ),
          deptButton(
            name: 'Urdu',
          ),
        ],
      ),
    );
  }
}

class deptButton extends StatelessWidget {
  const deptButton({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange.shade200),
          onPressed: () {},
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              name,
              style: TextStyle(color: Colors.black),
            ),
          )),
    ));
  }
}
