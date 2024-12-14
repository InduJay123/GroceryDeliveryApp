import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/colors.dart';
import 'auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key, }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  String sellerImageUrl = '';

  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageXFile;
    });
  }

  //from key
  final _formKey = GlobalKey<FormState>();
  //email password states
  String email = "";
  String password = "";
  String error = "";
  String name= "";
  String phone = "";
  String comPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: regbgColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Column(
              children: [

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                  InkWell(
                    onTap: () {
                      _getImage();
                    },
                    child: CircleAvatar(
                      radius: MediaQuery
                          .of(context)
                          .size
                          .width * 0.20,
                      backgroundColor: Colors.white,
                      backgroundImage: imageXFile == null ? null : FileImage(
                          File(imageXFile!.path)),
                      child: imageXFile == null
                          ?
                      Icon(Icons.add_photo_alternate,
                        size: MediaQuery
                            .of(context)
                            .size
                            .width * 0.20,
                        color: Colors.grey,
                      ) : null,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01, right: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.015),
                          child: TextFormField(
                            obscureText: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.person,
                                color:locbtnColor,
                              ),
                              focusColor: Theme.of(context).primaryColor,
                              hintText: "Name",
                            ),
                              validator: (val) =>
                              val?.isEmpty == true ? "Enter your name" : null,
                              onChanged: (val) {
                                setState(() {
                                 name = val;
                                });
                              },

                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01, right: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.015),
                          child: TextFormField(
                            obscureText: false,
                            style: const TextStyle(color: Colors.black),
                            //decoration:
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.email,
                                color:locbtnColor,
                              ),
                              focusColor: Theme.of(context).primaryColor,
                              hintText: "Email",
                            ),
                            validator: (val) =>
                            val?.isEmpty == true ? "Enter a valid email" : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01, right: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.015),
                          child: TextFormField(
                            obscureText: false,
                            style: const TextStyle(color: Colors.black),
                            //decoration:
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.phone,
                                color:locbtnColor,
                              ),
                              focusColor: Theme.of(context).primaryColor,
                              hintText: "Phone",
                            ),
                            validator: (val) =>
                            val!.length != 10 ? "Enter a valid phone number" : null,
                            onChanged: (val) {
                              setState(() {
                                phone = val;
                              });
                            },
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01, right: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.015),
                          child: TextFormField(
                            obscureText: true,
                            style: const TextStyle(color: Colors.black),
                            //decoration:
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color:locbtnColor,
                              ),
                              focusColor: Theme.of(context).primaryColor,
                              hintText: "Password",
                            ),
                            validator: (val) => val!.length < 6
                                ? "Password must be at least 6 characters"
                                : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01, right: MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.015),
                          child: TextFormField(
                            obscureText: true,
                            style: const TextStyle(color: Colors.black),
                            //decoration:
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color:locbtnColor,
                              ),
                              focusColor: Theme.of(context).primaryColor,
                              hintText: "Confirm Password",
                            ),
                            validator: (val) => val == password
                                ? "Password do not match"
                                : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                        //error text
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),

                        //button
                        SizedBox(height:MediaQuery.of(context).size.height * 0.03,),

                        ElevatedButton(
                          onPressed: () async {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);


                            if (result == null) {
                              //error
                              setState(() {
                                error = "please enter a valid email!";
                              });
                            }else{
                              const snackBar = SnackBar(
                                content: Text(
                                  "Successfully Registered!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                duration: Duration(seconds: 1),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.1,vertical: MediaQuery.of(context).size.width*0.03, )
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}