
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import 'package:thung_khao_rbac/Connect/Module/Admin.dart';
import './Widget/UpdatePersonalAdminWidget.dart';
import './Backend/UpdatePersonalAdminBackend.dart';
import 'package:rxdart/subjects.dart';
import 'package:provider/provider.dart';

class PersonalAdminUpdate extends StatefulWidget {
  final Admin admin;

  const PersonalAdminUpdate({Key key, this.admin}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PersonalAdminUpdateState();
  }
}

class PersonalAdminUpdateState extends State<PersonalAdminUpdate> {
  TextEditingController nameController;
  TextEditingController telController;
  TextEditingController addressController;

  BehaviorSubject subjectImagePath;
  @override
  void initState() {
    subjectImagePath = BehaviorSubject();
    nameController = TextEditingController(text: widget.admin.Name);
    telController = TextEditingController(text: widget.admin.Tel);
    addressController = TextEditingController(text: widget.admin.Address);
    super.initState();
  }


  @override
  void dispose() {
    subjectImagePath.close();
    print('Dispose Update Personal Admin ');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AdminMain())),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(),
        body: Container(
          margin: MediaQuery.of(context).padding,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('res/BackgroundAdmin.png'), fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,

                child: StreamBuilder(
                  stream: subjectImagePath.stream,
                  builder: (context, snapshot) {
                    Widget image;
                    if(snapshot.hasData){
                      image = ClipOval(
                          // borderRadius: BorderRadius.circular(50),
                          child: Image.file(snapshot.data,fit: BoxFit.cover,));
                    }
                    else{
                      image = CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                        NetworkImage(widget.admin.Image_URL),
                      );
                    }
                        return ListView(

                            children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              children: [
                                BackButton(
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: ()=>ReadFildPath(subjectImagePath),
                            child: Container(
                                height: MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: image),
                          ),
                          TextFormField(
                            controller: nameController,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          TextFormField(
                            controller: telController,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextFormField(
                            controller: addressController,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          ClickButton(
                            TextButton: ('บันทึกขอมูล'),
                            event: () => Provider.of<LoginConnection>(context,listen: false).updateAdminData(nameController.text, telController.text, addressController.text, snapshot.data.path.toString(),widget.admin.ID)
                          ),
                          ClickButton(
                            TextButton: ('ยกเลิก'),
                            event: () => Navigator.of(context).pop(),
                          ),
                        ]);

                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}