import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surichatapp/LoginPage.dart';

class HomePage extends StatelessWidget
{
  Future logOut(BuildContext context) async
  {
    FirebaseAuth auth = FirebaseAuth.instance;

    try{
      await auth.signOut().then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      });
    }
    catch(e)
    {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Container(
          padding: EdgeInsets.only(top: 7),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Home Screen",style: TextStyle(
                fontSize: 25,
                 ),
              ),
              actions: [
                IconButton(onPressed: ()=> logOut(context), icon: Icon(Icons.logout)),
              ],
            ),
            body: Container(
              alignment: Alignment.center,
              child: Text("Home",style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        )
    );
  }
}




