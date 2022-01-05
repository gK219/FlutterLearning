
import 'package:flutter/material.dart';
import 'package:my_flutter_app/utils/routes.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
     if (_formKey.currentState!.validate()) {
       setState(() {
         changedButton = true;
       });
       await Future.delayed(Duration(seconds: 1));
       await Navigator.pushNamed(
           context, MyRoutes.homeRoute);
       setState(() {
         changedButton = false;
       });}
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    onChanged: (value){
                      name = value;
                      setState(() {});
                    },
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "Username cannot be empty";
                  }

                  return null;
                },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "password"
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return "password cannot be empty";
                      }else if (value.length < 8 ){
                        return "Password must be 8 characters long";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(changedButton ? 40 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),

                      child : AnimatedContainer(
                        duration : Duration(seconds: 1),
                        alignment : Alignment.center,
                        width : changedButton ? 40 : 100,
                        height : 40,
                        child : changedButton ? Icon(
                          Icons.done,
                          color: Colors.white)
                            : Text("Login",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                        ),
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
      ),
    );
  }
}
