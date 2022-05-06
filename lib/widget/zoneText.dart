import 'package:flutter/material.dart';
import 'package:firstapplicationeisi/Fonctions/FirestoreHelper.dart';
import 'package:firstapplicationeisi/model/MyProfil.dart';

class ZoneText extends StatefulWidget {
  MyProfil partenaire;
  MyProfil moi;
  ZoneText(@required MyProfil this.partenaire, @required MyProfil this.moi);
  @override
  State<StatefulWidget> createState() {
    
    return ZoneTextState();
  }
}

TextEditingController _textEditingController = new TextEditingController();

class ZoneTextState extends State<ZoneText> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textEditingController,
              // ignore: prefer_const_constructors
              decoration: InputDecoration.collapsed(
                hintText: "écrivez votre message",
              ),

              maxLines: null,
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: _sendBouttonpressed)
        ],
      ),
    );
  }

  _sendBouttonpressed() {
    if (_textEditingController != null && _textEditingController != "") {
      String text = _textEditingController.text;
      print('enregistrement');
      FirestoreHelper().sendMessage(text, widget.partenaire, widget.moi);
      setState(() {
        _textEditingController.text = '';
      });
      FocusScope.of(context).requestFocus(new FocusNode());
      _sendMessage();
    }
  }

  _sendMessage() {
<<<<<<< HEAD
=======
    
>>>>>>> b1c7c727a946ecb0bbde13ceda3fe86404a0e7fe
    print(_textEditingController.text);
  }
}
