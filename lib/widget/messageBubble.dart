import 'package:flutter/material.dart';
import 'package:firstapplicationeisi/model/Message.dart';
import 'package:firstapplicationeisi/model/MyProfil.dart';

class messageBubble extends StatelessWidget {
  Message message;
  MyProfil partenaire;
  String monId;
  Animation? animation;

  messageBubble(@required String this.monId, @required MyProfil this.partenaire,
      @required Message this.message,
      {Animation? this.animation});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: widgetBubble(message.from == monId),
      ),
    );
  }

  List<Widget> widgetBubble(bool moi) {
    CrossAxisAlignment alignment =
        (moi) ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    Color colorBubble = (moi)
        ? Color.fromARGB(255, 143, 26, 26)
        : Color.fromARGB(255, 248, 141, 2);
    Color textcolor = Colors.white;

    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: alignment,
          children: [
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: colorBubble,
              child: Container(
                padding: EdgeInsets.all(animation?.value),
                child: Text(
                  message.texte,
                  style: TextStyle(color: textcolor),
                ),
              ),
            ),
          ],
        ),
      )
    ];
  }
}
