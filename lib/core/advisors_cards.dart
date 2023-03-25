import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tremglobal/service/advisors_service.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvisorCards extends StatefulWidget {
  const AdvisorCards({Key? key}) : super(key: key);

  @override
  State<AdvisorCards> createState() => _AdvisorCardsState();
}

class _AdvisorCardsState extends State<AdvisorCards> {
  final AdvisorsService _advisorsService = AdvisorsService();
  @override
  void initState() {
    super.initState();
  }

  //Yatırım danışmanlarının isme göre A-Z sıralanarak içeri alınması
  Stream<QuerySnapshot<Map<String, dynamic>>> _stream = FirebaseFirestore
      .instance
      .collection('Advisors')
      .orderBy('name', descending: false)
      .snapshots();
  //Tüm Dil Grupları butonuna ait filtre fonksiyonu
  void allGroups() {
    setState(() {
      _stream = FirebaseFirestore.instance
          .collection('Advisors')
          .orderBy('name', descending: false)
          .snapshots();
    });
  }

  //Belirli bir dil grubu seçilmesi halinda kullanılacak fonksiyon
  void changeGroup(String lanGroup) {
    setState(() {
      _stream = FirebaseFirestore.instance
          .collection('Advisors')
          .where('team', isEqualTo: lanGroup)
          .orderBy('name', descending: false)
          .snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white60,
                elevation: 0,
                side: const BorderSide(
                  color: Colors.black54,
                ),
              ),
              onPressed: () {
                allGroups();
              },
              child: const FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Tüm Dil Grupları',
                  style: TextStyle(color: Colors.black54),
                ),
              )),
        ),
        Row(
          children: [
            lanGroupButton(
              group: () {
                changeGroup('Arabic');
              },
              language: 'Arabic',
            ),
            lanGroupButton(
              group: () {
                changeGroup('English');
              },
              language: 'English',
            ),
            lanGroupButton(
              group: () {
                changeGroup('Persian');
              },
              language: 'Persian',
            ),
            lanGroupButton(
              group: () {
                changeGroup('Russian');
              },
              language: 'Russian',
            ),
            lanGroupButton(
              group: () {
                changeGroup('Urdu');
              },
              language: 'Urdu',
            ),
          ],
        ),
        SizedBox(
          height: 210,
          width: 1000,
          child: StreamBuilder(
            stream: _stream,
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const Center(child: Text('Veri Bulunmamaktadır.'))
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot myAdvisors =
                            snapshot.data!.docs[index];
                        var name = myAdvisors['name'];
                        var dept = myAdvisors['team'];
                        var pic = myAdvisors['image'];

                        return InkWell(
                          onTap: () {
                            Scaffold.of(context).showBottomSheet((context) {
                              DateTime _date = DateTime.utc(myAdvisors['year'],
                                  myAdvisors['month'], myAdvisors['day']);

                              int workDay =
                                  DateTime.now().difference(_date).inHours;

                              int workMonth = ((workDay / 24) / 30).round();

                              String phoneNumber = myAdvisors['tel'];
                              String whatsappPhone =
                                  'https://wa.me/905413068959';
                              //Arama ekranına yönlendirmek için kullanılan fonksiyon
                              Future<void> _makePhoneCall(
                                  String phoneNumber) async {
                                final Uri launchUri = Uri(
                                  scheme: 'tel',
                                  path: phoneNumber,
                                );
                                await launchUrl(launchUri);
                              }

                              //Mail ekranına yönlendirmek için kullanılan fonksiyon
                              Future<void> _sendEmaii() async {
                                final Uri _emailLauncherUri = Uri(
                                  scheme: 'mailto',
                                  path: '${myAdvisors['mail']}',
                                );
                                launchUrl(_emailLauncherUri);
                              }

                              String explain =
                                  "Yatırım danışmanlarının ilgili tüm performans ve lead durumları bu alanda yer alacaktır.";

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      width: 70,
                                      child: Divider(
                                        thickness: 3,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  myAdvisors['image']),
                                            ),
                                            Text(
                                              myAdvisors['name'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  ?.copyWith(
                                                      color: Colors
                                                          .yellow.shade900),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Görevi',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child:
                                                Text('${myAdvisors['title']}')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Dil Grubu',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child:
                                                Text('${myAdvisors['team']}')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'E-mail Adresi',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child:
                                                Text('${myAdvisors['mail']}')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Telefon No',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child:
                                                Text('${myAdvisors['tel']}')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'İşe Giriş Tarihi',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${_date.day}.${_date.month}.${_date.year}',
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              'Kıdem',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                              '$workMonth Ay',
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 150,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _makePhoneCall(
                                                  '${myAdvisors['tel']}');
                                            },
                                            child: const Icon(
                                              Icons.phone_rounded,
                                              size: 40,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              _sendEmaii();
                                            },
                                            child: Icon(
                                              Icons.mail_rounded,
                                              size: 40,
                                              color: Colors.red.shade700,
                                            ),
                                          ),
                                          const InkWell(
                                            child: Icon(
                                              Icons.whatsapp_rounded,
                                              size: 40,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        content: Text(
                                                            '${myAdvisors['name']} isimli personeli sistemden kalıcı olarak silmek istediğinize emin misiniz?'),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Hayır')),
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                _advisorsService
                                                                    .deleteAdvisors(
                                                                        myAdvisors
                                                                            .id);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                  'Evet'))
                                                        ],
                                                      ));
                                            },
                                            icon: const Icon(
                                              Icons.delete_rounded,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 400,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Bireysel Performans',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8,
                                                    bottom: 5,
                                                    left: 15,
                                                    right: 15,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      _statuChart(
                                                        count: '15',
                                                        statu: 'Açık',
                                                        customheight: 50,
                                                      ),
                                                      _statuChart(
                                                        statu: 'Belirsiz',
                                                        count: '28',
                                                        customheight: 70,
                                                      ),
                                                      _statuChart(
                                                        statu: 'Olumlu',
                                                        count: '10',
                                                        customheight: 30,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  'Lead Durumları',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                ),
                                              ],
                                            ),
                                            const Divider(),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(50),
                                                child: Text(explain),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                          },
                          child: _advisorCard(
                            text1: name,
                            text2: dept,
                            pic: pic,
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}

//Dil grubu seçimleri için kullanılan buton widgetı
class lanGroupButton extends StatelessWidget {
  const lanGroupButton({
    Key? key,
    required this.group,
    required this.language,
  }) : super(key: key);

  final VoidCallback group;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: Colors.deepOrange.shade50),
          onPressed: () {
            group;
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              language,
              style: TextStyle(color: Colors.black54),
            ),
          )),
    ));
  }
}

//Rapor örneği için kullanılan fonksiyon
class _statuChart extends StatelessWidget {
  const _statuChart({
    Key? key,
    required this.statu,
    required this.count,
    required this.customheight,
  }) : super(key: key);

  final String statu;
  final String count;
  final double customheight;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 100,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                statu,
                style: const TextStyle(fontSize: 18),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: customheight,
                    color: const Color(0xff60bad7),
                  ),
                  Text(count),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _advisorCard extends StatelessWidget {
  const _advisorCard(
      {Key? key, required this.text1, required this.text2, required this.pic})
      : super(key: key);
  final String text1;
  final String text2;
  final pic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 210,
        height: 210,
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(pic),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.black,
                        ],
                        stops: [
                          0.0,
                          1.0
                        ]))),
            Padding(
              padding: const EdgeInsets.only(top: 170, left: 10),
              child: Text(
                text1,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 185, left: 10),
              child: Text(
                text2,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class deptButton extends StatefulWidget {
  const deptButton({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  State<deptButton> createState() => _deptButtonState();
}

class _deptButtonState extends State<deptButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange.shade200),
          onPressed: () {
            setState(() {});
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              widget().name,
              style: const TextStyle(color: Colors.black),
            ),
          )),
    ));
  }
}
