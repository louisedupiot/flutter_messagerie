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
    // TODO: implement createState
    return chatControllerState();
  }
}

class chatControllerState extends State<chatController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "${widget.partenaire.prenom} ${widget.partenaire.nom}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red,
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
      child: InkWell(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Column(
          children: [
            //Zone de chat
            new Flexible(
                child: Container(
              height: MediaQuery.of(context).size.height,
              child: Messagecontroller(widget.moi, widget.partenaire),
            )),
            //Divider
            new Divider(
              height: 1.5,
            ),
            //Zone de text
            ZoneText(widget.partenaire, widget.moi),
          ],
        ),
      ),
    );
  }
}
