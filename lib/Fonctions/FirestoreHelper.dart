import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstapplicationeisi/model/MyProfil.dart';

class FirestoreHelper {
  final auth = FirebaseAuth.instance;
  final fireUser = FirebaseFirestore.instance.collection("Users");
  final storage = FirebaseStorage.instance;

  final fire_message = FirebaseFirestore.instance.collection("Message");
  final fire_conversation =
      FirebaseFirestore.instance.collection('Conversations');

<<<<<<< HEAD
  //Méthodes

=======
>>>>>>> b1c7c727a946ecb0bbde13ceda3fe86404a0e7fe
  Future Inscription(
      String prenom, String nom, String mail, String password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: mail, password: password);
    String uid = result.user!.uid;
    Map<String, dynamic> map = {
      "PRENOM": prenom,
      "NOM": nom,
      "MAIL": mail,
    };
    addUser(uid, map);
  }

  Future<MyProfil> Connexion(String mail, String password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: mail, password: password);
    String uid = result.user!.uid;
    DocumentSnapshot snapshot = await fireUser.doc(uid).get();
    return MyProfil(snapshot);
  }

<<<<<<< HEAD
=======

>>>>>>> b1c7c727a946ecb0bbde13ceda3fe86404a0e7fe
  addUser(String uid, Map<String, dynamic> map) {
    fireUser.doc(uid).set(map);
  }

  updateUser(String uid, Map<String, dynamic> map) {
    fireUser.doc(uid).update(map);
  }

  deconnexion() {
    auth.signOut();
  }

  Future<String> stockageImage(String nameImage, Uint8List data) async {
    String urlChemin = "";
    TaskSnapshot download = await storage.ref("image/$nameImage").putData(data);
    urlChemin = await download.ref.getDownloadURL();
    return urlChemin;
  }

  sendMessage(String texte, MyProfil user, MyProfil moi) {
    DateTime date = DateTime.now();
    Map<String, dynamic> map = {
      'from': moi.uid,
      'to': user.uid,
      'texte': texte,
      'envoiMessage': date
    };

    String idDate = date.microsecondsSinceEpoch.toString();

    addMessage(map, getMessageRef(moi.uid, user.uid, idDate));

    addConversation(getConversation(moi.uid, user, texte, date), moi.uid);

    addConversation(getConversation(user.uid, moi, texte, date), user.uid);
  }

  Map<String, dynamic> getConversation(
      String sender, MyProfil partenaire, String texte, DateTime date) {
    Map<String, dynamic> map = partenaire.toMap();
    map['idmoi'] = sender;
    map['lastmessage'] = texte;
    map['envoimessage'] = date;
    map['destinateur'] = partenaire.uid;

    return map;
  }

  String getMessageRef(String from, String to, String date) {
    String resultat = "";
    List<String> liste = [from, to];
    liste.sort((a, b) => a.compareTo(b));
    for (var x in liste) {
      resultat += x + "+";
    }
    resultat = resultat + date;
    return resultat;
  }

  addMessage(Map<String, dynamic> map, String uid) {
    fire_message.doc(uid).set(map);
  }

  addConversation(Map<String, dynamic> map, String uid) {
    fire_conversation.doc(uid).set(map);
  }
}
