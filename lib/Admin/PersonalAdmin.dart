
import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/UpdatePresonalAdmin.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import './Widget/PersonalAdminWidget.dart';
import 'package:minimize_app/minimize_app.dart';
import 'package:provider/provider.dart';
import 'package:thung_khao_rbac/Connect/BackEnd/Login.dart';
import './Backend/PersonalAdminBackend.dart';
class PersonalAdminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalState();
  }
}

class PersonalState extends State<PersonalAdminMain> {

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    print('Dispose Personal Admin ');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>MinimizeApp.minimizeApp(),
      child: Scaffold(
        bottomNavigationBar: MenuNavigation(page: 3,),
        body: Container(
          margin: MediaQuery.of(context).padding,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('res/BackgroundShop.png'), fit: BoxFit.cover),
                ),
              ),
              FutureBuilder(
                future: Provider.of<LoginConnection>(context).showAdminData(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    if(snapshot.data != 'error'){
                        return Container(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.01,
                              0,
                              MediaQuery.of(context).size.width * 0.01,
                              0),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 1,
                          child: Column(children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      NetworkImage(snapshot.data.Image_URL),
                                )),
                            TextName(
                              SelfNameText: snapshot.data.Name,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            TextUnderName(
                              FrontText: ('ตำแหน่ง'),
                              EndText: snapshot.data.Position,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            TextUnderName(
                              FrontText: ('เบอร์โทร'),
                              EndText: snapshot.data.Tel,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            TextUnderName(
                              FrontText: ('เข้าสู่ระบบล่าสุด'),
                              EndText: snapshot.data.DateLogin,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                            ClickButton(
                              TextButton: ('แก้ไขโปรไฟล์'),
                              event: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PersonalAdminUpdate(admin: snapshot.data,))),
                            ),
                            ClickButton(
                              TextButton: ('ออกจากระบบ'),
                              event: () => logout(context),
                            ),
                          ]),
                        );
                      }
                    else{
                      return Center(child: Text('เกิดข้อผิดพลาดทางเครือข่าย กรุณาลองใหม่อีกครั้ง'),);
                    }
                    }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}