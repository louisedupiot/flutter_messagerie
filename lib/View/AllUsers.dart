import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplicationeisi/Fonctions/FirestoreHelper.dart';
import 'package:firstapplicationeisi/controller/chatController.dart';
import 'package:firstapplicationeisi/library/constant.dart';
import 'package:firstapplicationeisi/model/MyProfil.dart';
import 'package:firstapplicationeisi/modelView/ImageRond.dart';
import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return AllUsersState();
  }
}

class AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    
    return bodyPage();
  }

  Widget bodyPage() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().fireUser.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
<<<<<<< HEAD
          } else {
=======
          }
          else {
>>>>>>> b1c7c727a946ecb0bbde13ceda3fe86404a0e7fe
            List documents = snapshot.data!.docs;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  MyProfil users = MyProfil(documents[index]);
                  if (users.uid == Myprofil.uid) {
                    return Container();
                  } else {
                    // ignore: unnecessary_new
                    return new InkWell(
                      child: Card(
                        elevation: 5.0,
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          //Image
                          leading: ImageRond(image: users.image, size: 60),
                          trailing: IconButton(
                            icon: const Icon(Icons.chat_bubble),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return chatController(Myprofil, users);
                              }));
                            },
                          ),

                          title: Text("${users.prenom} ${users.nom}"),
                          subtitle: Text("${users.mail}"),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return chatController(Myprofil, users);
                        }));
                      },
                    );
                  }
                });
          }
        });
  }
}
