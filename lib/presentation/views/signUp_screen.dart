import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/utils/extentions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../core/params/request_params.dart';
import '../blocs/user_login/remote_user_login_bloc.dart';
import '../blocs/user_register/remote_user_register_bloc.dart';
import 'helper.dart';
import 'login_screen.dart';

class ScreenSignup extends StatefulWidget {
  @override
  _ScreenSignupState createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailEditingController= TextEditingController();
  TextEditingController _passEditingController= TextEditingController();
  TextEditingController _nameEditingController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return
      SafeArea(child: BlocConsumer<RemoteUserRegisterBloc,UserState>(
          listener: (context,state){
            if(state is UserRegisterDone)
              Navigator.pushNamed(context, '/dashboard',arguments:state.user);
          },
          builder: (context, state){
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: buildButton(),
                title: Text(
                  "Sign up",
                  style: textStyle,
                ),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      buildGoogleAppleFunction(mq),
                      buildText(name: "Name", choose: textStyle2),
                      buildNameField(),
                      buildText(name: "Email", choose: textStyle2),
                      buildEmailField(),
                      buildText(name: "Password", choose: textStyle2),
                      buildPasswordField(),
                      SizedBox(
                        height: 25,
                      ),
                      buildCreateanAccount(),
                      buildTaptoLogin(context),
                    ],
                  ),),
              ),
            );
          }));


  }

  Widget buildButton() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey),
            elevation: 15.0,
            minimumSize: Size(20, 50),
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios, color: Colors.white));
  }

  Widget buildGoogleAppleFunction(Size mq) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 5, right: 3, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    elevation: 15.0,
                    minimumSize: Size(mq.width * 0.8, 50),
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  print("Icon Google");
                },
                child: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                )),
          ),

        ],
      ),
    );
  }

  Widget buildNameField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 5, right: 3),
      child: TextFormField(
        validator: (text){
          return text.isNotEmpty ? null : "Name missing";
        },
        controller: _nameEditingController,
        style: textStyle2,
        cursorColor: Colors.white,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            hintText: "Full Name",
            hintStyle: textStyle1,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  Widget buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 5, right: 3),
      child: TextFormField(
        validator: (text){
          return text.isValidEmail() ? null : "Check your email";
        },
        controller: _emailEditingController,
        style: textStyle2,
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: "Enter Email",
            hintStyle: textStyle1,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  Widget buildText({String name, TextStyle choose}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10),
      child: Text(
        name,
        style: choose,
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 5, right: 3),
      child: TextFormField(
        validator: (text){
          return text.isNotEmpty ? null : "Password missing";
        },
        controller: _passEditingController,
        style: textStyle2,
        cursorColor: Colors.white,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            hintText: "Enter Password",
            hintStyle: textStyle1,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  Widget buildCreateanAccount() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: ElevatedButton(
        onPressed: () {
          if(_formKey.currentState.validate()){
            String email = _emailEditingController.text;
            String pass = _passEditingController.text;
            String namer = _nameEditingController.text;
            context.read<RemoteUserRegisterBloc>().add(RegisterUserEvent(
                RegisterRequestParams(email: email, password: pass,username: namer)));
          }
        },
        child: Text("Create Account",style: TextStyle(color: Colors.black),),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: Size(500, 48),
            primary: Colors.white),
      ),
    );
  }

  Widget buildTaptoLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: textStyle1,
          ),
          SizedBox(
            width: 8,
          ),
          TextButton(
              onPressed: () {
               Navigator.pushNamed(context, "/");
              },
              child: Text(
                "Log in",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
