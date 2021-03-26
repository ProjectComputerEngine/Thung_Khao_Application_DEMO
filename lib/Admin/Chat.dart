import './Widget/ChatWidget.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class ChatBoxMain extends StatefulWidget {
  final String idSender;
  final String name;

  const ChatBoxMain({Key key, this.idSender, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChatBoxStat();
  }
}

class ChatBoxStat extends State<ChatBoxMain> {

  TextEditingController messageController;

  @override
  void dispose() {
    print('Dispose Chat Complete');
    super.dispose();
  }

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 50, 50, 10),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Color.fromRGBO(32, 50, 50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(),
                  NameText(name: 'Test'),
                  CallButton(),
                  SettingButton(),
                ],
              ),
            ),
            Flexible(
              child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("res/Background.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    FutureBuilder(
                        future: Future.value(true),
                        builder:(context,snapshost) {
                          if(snapshost.hasData) {
                            return ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              itemBuilder: (context, index) {
return AdminText(message: 'สวัสดีครับ',UrlImage: 'http://128.199.110.176:8080/upload/img/8images.jpeg',);
                              },
                              itemCount: 1,
                            );
                          }
                          else{
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                    ),
                    // StreamBuilder(
                    //     stream: channel.stream,
                    //     builder: (context, snaphost) {
                    //
                    //       if (snaphost.hasData) {
                    //         var data = jsonDecode(snaphost.data);
                    //         if(snaphost.connectionState == ConnectionState.active){
                    //           var data = jsonDecode(snaphost.data);
                    //           messageList.add(AdminText(message: data['message'],));
                    //         }
                    //       } else {}
                    //       return ListView.builder(
                    //         itemBuilder: (context, index) {
                    //           return messageList[index];
                    //         },
                    //         itemCount: messageList.length,
                    //       );
                    //     }),
                  ]),),
            Container(
              color: Colors.black38,
              height: MediaQuery.of(context).size.height * 0.075,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PhotoButton(),
                  AccessField(
                    messageController: messageController,
                  ),
                  SendButton(send: (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
