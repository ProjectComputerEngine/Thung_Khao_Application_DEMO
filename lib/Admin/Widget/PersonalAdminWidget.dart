import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Configuration.dart';
import 'package:thung_khao_rbac/Admin/UpdatePresonalAdmin.dart';

class ClickButton extends StatelessWidget {
  final String TextButton;
  final Function event;

  const ClickButton({
    Key key,
    this.TextButton, this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(255, 255, 255,30),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: FlatButton(
          padding: EdgeInsets.zero,
          child: Text(
            TextButton,
            style: TextStyle(fontSize: Config.PersonalAdmin_fontB),
          ),
          onPressed: event,
        ),
      ),
    );
  }
}

class TextUnderName extends StatelessWidget {
  final String FrontText;
  final String EndText;

  const TextUnderName({
    Key key,
    this.FrontText,
    this.EndText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.08, 0,
          MediaQuery.of(context).size.width * 0.05, 0),
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Container(
            child: Text(
              FrontText,
              style: TextStyle(color: Colors.black87,fontSize: Config.PersonalAdmin_fontH),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Container(
            child: Text(
              EndText,
              style: TextStyle(color: Colors.grey,fontSize: Config.PersonalAdmin_fontH),
            ),
          )
        ],
      ),
    );
  }
}

class TextName extends StatelessWidget {
  final String SelfNameText;

  const TextName({
    Key key,
    this.SelfNameText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        SelfNameText,
        style: TextStyle(
          fontSize: Config.PersonalAdmin_fontHB,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 5.0,
              color: Colors.grey,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }
}

class PictureProfile extends StatelessWidget {
  final String url;
  const PictureProfile({
    Key key, this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(url),)),
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.25,
        child: FlatButton(
          minWidth: MediaQuery.of(context).size.width * 0.5,
          onPressed: () => {},
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
