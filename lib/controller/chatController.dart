import 'package:flutter/material.dart';
import 'package:firstapplicationeisi/controller/messageController.dart';
import 'package:firstapplicationeisi/widget/zoneText.dart';
import 'package:firstapplicationeisi/model/MyProfil.dart';

class chatController extends StatefulWidget {
  MyProfil moi;
  MyProfil partenaire;
  chatController(@required this.moi, @required this.partenaire);
  @override
  State<StatefulWidget> createState() {
    return chatControllerState();
  }
}

class chatControllerState extends State<chatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "${widget.partenaire.prenom} ${widget.partenaire.nom}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 211, 88, 88),
        body: Stack(
          children: [
            bodyPage(),
          ],
        ));
  }

  Widget bodyPage() {
    print(widget.moi.uid);
    print(widget.partenaire.uid);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/background-image.jpg"),
            fit: BoxFit.cover),
      ),
      child: InkWell(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Column(
          children: [

            new Flexible(
                child: Container(
              height: MediaQuery.of(context).size.height,
              child: Messagecontroller(widget.moi, widget.partenaire),
            )),

            new Divider(
              height: 1.5,
            ),

            ZoneText(widget.partenaire, widget.moi),
          ],
        ),
      ),
    );
  }
}
