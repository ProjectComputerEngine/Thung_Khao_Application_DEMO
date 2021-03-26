import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/AdminMain.dart';
class AdminText extends StatelessWidget {
  const AdminText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white24),
            child: Text(
              '555555555555',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: ShapeDecoration(
                shape: CircleBorder(), color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class UserText extends StatelessWidget {
  const UserText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.white),
                  ),
                ],
              )),
          SpaceWidth(),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white24),
            child: Text(
              '555555555555',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class SpaceWidth extends StatelessWidget {
  const SpaceWidth({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.01,
    );
  }
}

class Spaceheight extends StatelessWidget {
  const Spaceheight({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          padding: EdgeInsets.zero,
          minWidth: MediaQuery.of(context).size.width * 0,
          onPressed: () => {},
          child: Icon(
            Icons.settings,
            color: Colors.white,
            size: 20,
          )),
    );
  }
}

class CallButton extends StatelessWidget {
  const CallButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          minWidth: MediaQuery.of(context).size.width * 0,
          padding: EdgeInsets.zero,
          onPressed: () => {},
          child: Icon(
            Icons.call,
            color: Colors.white,
            size: 20,
          )),
    );
  }
}

class NameText extends StatelessWidget {
  final String name;
  const NameText({
    Key key, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$name',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.5,
    );
  }
}

class BackButtons extends StatelessWidget {
  const BackButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        minWidth: MediaQuery.of(context).size.width * 0,
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMain() ))
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => {},
      minWidth: MediaQuery.of(context).size.width * 0.0,
      child: Icon(
        Icons.send,
        color: Colors.white,
      ),
    );
  }
}

class AccessField extends StatelessWidget {
  const AccessField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.01,
              0,
              MediaQuery.of(context).size.width * 0.01,
              0),
        ),
      ),
    );
  }
}

class PhotoButton extends StatelessWidget {
  const PhotoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          FlatButton(
              onPressed: () => {},
              minWidth: MediaQuery.of(context).size.width * 0.0,
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 20,
              )),
          FlatButton(
              onPressed: () => {},
              minWidth: MediaQuery.of(context).size.width * 0.0,
              child: Icon(
                Icons.photo,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

class MassageTitle extends StatelessWidget {
  const MassageTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'กล่องข้อมูล',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}


class MessageButtons extends StatelessWidget {
  final Color TimeColor;
  final Color NewNameColor;
  final Color NewColorText;
  final String NewMessgeText;
  final Color ChangeColorsCircle;
  final String nameUesr;
  final String lastmessage;
  final String time;
  final String imageurl;
  final Function gotoMessage;

  const MessageButtons({
    Key key,
    this.NewMessgeText,
    this.ChangeColorsCircle,
    this.NewColorText,
    this.NewNameColor,
    this.TimeColor,
    this.nameUesr,
    this.lastmessage,
    this.time,
    this.imageurl, this.gotoMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: FlatButton(
        onPressed: gotoMessage,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color.fromRGBO(42, 64, 87, 20),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.15,
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.01,
                    0.01,
                    MediaQuery.of(context).size.width * 0.01,
                    0.01),
                width: MediaQuery.of(context).size.width * 0.12,
                decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage('$imageurl'),
                    ),
                    color: Colors.white,
                    shape: CircleBorder()),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$nameUesr',
                      style: TextStyle(color: NewNameColor, fontSize: 12),
                    ),
                    Text(
                      '$lastmessage',
                      style: TextStyle(color: NewColorText, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$time',
                      style: TextStyle(color: TimeColor, fontSize: 8),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width * 0.055,
                      width: MediaQuery.of(context).size.width * 0.055,
                      decoration: ShapeDecoration(
                          color: ChangeColorsCircle, shape: CircleBorder()),
                      child: Text(
                        NewMessgeText,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 8,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


