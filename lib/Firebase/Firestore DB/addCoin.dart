import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCoin {
  CollectionReference coins = FirebaseFirestore.instance.collection('coins');
  Future add(
      {required String uid,
      // ignore: non_constant_identifier_names
      required String coin_name,
      // ignore: non_constant_identifier_names
      required String coin_id,
      // ignore: non_constant_identifier_names
      required var buying_price,
      required var quantity,
      // ignore: non_constant_identifier_names
      required String img_url,
      required String date}) {
    return coins
        .add({
          'uid': uid,
          'coin_name': coin_name,
          'coin_id': coin_id,
          'buying_price': buying_price,
          'quantity': quantity,
          'img_url': img_url,
          'date': date
        })
        .then((value) => print("Coin Added"))
        .catchError((error) => print("Failed to add coin: $error"));
  }
}
