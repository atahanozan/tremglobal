import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tremglobal/model/advisors.dart';

//Firebasede toplanan datalar üzerinde işlem yapmak için kullanılan sınıf
class AdvisorsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Data eklemek için kullanılan fonksiyon
  Future<Advisors> addAdvisor(
    String name,
    String team,
    String mail,
    String tel,
    String city,
    String image,
    String title,
    int day,
    int month,
    int year,
  ) async {
    var ref = _firestore.collection('Advisors');

    var documentRef = await ref.add({
      'name': name,
      'team': team,
      'mail': mail,
      'tel': tel,
      'city': city,
      'image': image,
      'title': title,
      'day': day,
      'month': month,
      'year': year,
    });

    return Advisors(
      id: documentRef.id,
      name: name,
      team: team,
      mail: mail,
      tel: tel,
      city: city,
      image: image,
      title: title,
      day: day,
      month: month,
      year: year,
    );
  }

  //Dataları çekmek için kullanılan fonksiyon
  Stream<QuerySnapshot> getAdvisors() {
    var ref = _firestore
        .collection('Advisors')
        .orderBy('name', descending: true)
        .snapshots();
    return ref;
  }

  //Data id lerine göre belirtilen id deki datayı silmek için kullanılan fonksiyon
  Future<void> deleteAdvisors(String docId) {
    var ref = _firestore.collection('Advisors').doc(docId).delete();

    return ref;
  }
}
