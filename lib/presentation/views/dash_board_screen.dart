import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';


class DashboardScreen extends StatelessWidget {
  final User user;
  const DashboardScreen({Key key,this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  color:  Colors.black,
              ),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        CircleAvatar(
                        backgroundImage: NetworkImage(
                         user.url??"https://cdn-icons-png.flaticon.com/128/3135/3135715.png"
                        ),
                        radius: 50.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        user.name,
                        style:const TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        user.email,
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                    ],
                  ),
                ),
              )
          ),

        ],
      ),),),
    );
  }



}
