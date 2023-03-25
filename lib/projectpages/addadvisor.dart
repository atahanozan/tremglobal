import 'package:flutter/material.dart';
import 'package:tremglobal/service/advisors_service.dart';

class AddAdvisorPageView extends StatefulWidget {
  const AddAdvisorPageView({Key? key}) : super(key: key);

  @override
  State<AddAdvisorPageView> createState() => _AddAdvisorPageViewState();
}

class _AddAdvisorPageViewState extends State<AddAdvisorPageView> {
  final AdvisorsService _advisorsService = AdvisorsService();
  final _name = TextEditingController();
  final _mail = TextEditingController();
  final _tel = TextEditingController();

  String team = 'Arabic';
  String city = 'İstanbul';
  String title = 'Yatırım Danışmanı';
  String imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/tremglobal-34927.appspot.com/o/profilepic.png?alt=media&token=9d1496b1-c82a-4ad8-b3f3-e1af22b78562';

  String day = '1';
  String month = '1';
  String year = '2010';

  var items = [
    'Arabic',
    'English',
    'Persian',
    'Russian',
    'Urdu',
  ];

  var titles = [
    'Yatırım Danışmanı',
    'Kıdemli Yatırım Danışmanı',
    'Acente Uzmanı',
    'Acente Uzman Yardımcısı',
    'Takım Lideri',
  ];

  var cities = [
    'İstanbul',
    'Antalya',
  ];

  var days = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];

  var months = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];

  var years = [
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('İsim Soyisim')),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _name,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('E-mail Adresi')),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _mail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Telefon Numarası')),
                    Expanded(
                      flex: 2,
                      child: TextField(
                        controller: _tel,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Görevi')),
                    Expanded(
                      flex: 2,
                      child: DropdownButton(
                        value: title,
                        items: titles.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            title = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Dil Grubu')),
                    Expanded(
                      flex: 2,
                      child: DropdownButton(
                        value: team,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            team = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Şehir')),
                    Expanded(
                      flex: 2,
                      child: DropdownButton(
                        value: city,
                        items: cities.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            city = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('İşe Giriş Tarihi')),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton(
                            value: day,
                            items: days.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                day = newValue!;
                              });
                            },
                          ),
                          DropdownButton(
                            value: month,
                            items: months.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                month = newValue!;
                              });
                            },
                          ),
                          DropdownButton(
                            value: year,
                            items: years.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                year = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _advisorsService.addAdvisor(
                        _name.text,
                        team,
                        _mail.text,
                        _tel.text,
                        city,
                        imageUrl,
                        title,
                        int.parse(day),
                        int.parse(month),
                        int.parse(year),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${_name.text} isimli yatırım danışmanı sisteme eklenmiştir.')));
                      _name.clear();
                      _mail.clear();
                      _tel.clear();
                    });
                  },
                  child: const Text('Danışman Ekle'))
            ],
          ),
        ),
      ),
    );
  }
}
