import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplicationeisi/library/constant.dart';
import 'package:flutter/material.dart';
import 'package:firstapplicationeisi/widget/messageBubble.dart';
import 'package:firstapplicationeisi/Fonctions/FirestoreHelper.dart';
import 'package:firstapplicationeisi/model/Message.dart';
import 'package:firstapplicationeisi/model/MyProfil.dart';

class Messagecontroller extends StatefulWidget {
  MyProfil id;
  MyProfil idPartner;
  Messagecontroller(
      @required MyProfil this.id, @required MyProfil this.idPartner);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessagecontrollerState();
  }
}

class MessagecontrollerState extends State<Messagecontroller>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    animation = Tween<double>(begin: 10, end: 20).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper()
            .fire_message
            .orderBy('envoiMessage', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (BuildContext ctx, int index) {
                  Message discussion = Message(documents[index]);
                  if ((discussion.from == widget.id.uid &&
                          discussion.to == widget.idPartner.uid) ||
                      (discussion.from == widget.idPartner.uid &&
                          discussion.to == widget.id.uid)) {
                    return messageBubble(
                      widget.id.uid,
                      widget.idPartner,
                      discussion,
                      animation: animation,
                    );
                  } else {
                    return Container();
                  }
                });
          }
        });
  }
}
