
import 'package:flutter/material.dart';
import 'package:my_flutter_app/utils/routes.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/image/login_img.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username"
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "password"
                  ),
                  onChanged: (value){
                    name = value;
                    setState(() {

                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),

                InkWell(
                  onTap: () async {
                    setState(() {
                      changedButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    alignment: Alignment.center,
                    width: changedButton ? 50 : 100,
                    height: 45,
                    child: changedButton ? Icon(
                      Icons.done,
                      color: Colors.white)
                        Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changedButton ? 50 : 8)
                    ),
                  ),
                )
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                //     },
                //     child: Text("login",style: TextStyle(
                //       fontSize: 20
                //     ),),
                //     style: TextButton.styleFrom(
                //       minimumSize: Size(100,40)
                //     ),
                //     ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
