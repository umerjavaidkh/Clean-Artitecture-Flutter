import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/utils/extentions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/params/request_params.dart';
import '../../domain/entities/user.dart';
import '../blocs/user_login/remote_user_login_bloc.dart';
import 'helper.dart';
import 'signUp_screen.dart';

class ScreenLogin extends StatefulWidget {
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {


  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount _currentUser;

  TextEditingController _emailEditingController= TextEditingController();
  TextEditingController _passEditingController= TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser);
      }
    });
    _googleSignIn.signInSilently();

  }


  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    print("$user");
  }


  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(child: BlocConsumer<RemoteUserLoginBloc,UserState>(
        listener: (context,state){
          if(state is UserLoginDone)
            Navigator.pushNamed(context, '/dashboard',arguments:state.user);
        },
        builder: (context, state){

          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              //leading: buildButton(),
              title: Text(
                "Log in",
                style: textStyle,
              ),
            ),
            body:
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    buildGoogleAppleFunction(mq),
                    buildText(name: "Email", choose: textStyle2),
                    buildEmailField(),
                    buildText(name: "Password", choose: textStyle2),
                    buildPasswordField(),
                    const SizedBox(
                      height: 25,
                    ),
                    buildTaptoLogin(),
                    buildTaptoSignup(context),
                  ],
                ),),
            ),
          );

        }));


  }



  Widget buildText({String name, TextStyle choose}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Text(
        name,
        style: choose,
      ),
    );
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
                  _handleSignIn();
                },
                child: const Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                )),
          ),

        ],
      ),
    );
  }

  Widget buildTaptoLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: ElevatedButton(
        onPressed: () {

          if(_formKey.currentState.validate()) {
            String email = _emailEditingController.text;
            String pass = _passEditingController.text;
            context.read<RemoteUserLoginBloc>().add(LoginUserEvent(
                LoginRequestParams(email: email, password: pass)));
          }
        },
        child:const Text("Log in",style: TextStyle(color: Colors.black),),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            minimumSize: const Size(500, 48),
            primary: Colors.white),
      ),
    );
  }

  // we can do the same with google signin by creating bloc and usecasd
  Future<void> _handleSignIn() async {
    try {
     var result = await _googleSignIn.signIn();
     if(result!=null){
       var user = User(name: result.displayName,id: result.id,email: result.email,url: result.photoUrl);
       Navigator.pushNamed(context, "dashboard",arguments: user);
     }
    } catch (error) {
      print(error);
    }
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 5, right: 3),
      child: TextFormField(
        validator: (text){
          return text.isNotEmpty ? null : "Password missing";
        },
        controller: _passEditingController,
        cursorColor: Colors.white,
        style: textStyle2,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            hintStyle: textStyle1,
            hintText: "Enter your password",
            border: OutlineInputBorder(
                borderSide:const BorderSide(color:  Colors.white),
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
        cursorColor: Colors.white,
        style: textStyle2,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const  BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            hintStyle: textStyle1,
            hintText: "Enter Email",
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  Widget buildTaptoSignup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: textStyle1,
          ),
         const SizedBox(
            width: 8,
          ),
          TextButton(
              onPressed: () {
                /*Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ScreenSignup()));*/
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text(
                "Sign up",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}