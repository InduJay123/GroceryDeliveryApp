import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/navigation_bar.dart';
import '../../utils/colors.dart';
import 'auth.dart';

class SignIn extends StatefulWidget {
  //final Function toggle;
  const SignIn({Key? key,
    //required this.toggle
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: regbgColor,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 50,bottom: 195),
                  child: Form(
                    key: _formKey, //validate key
                    child: Column(
                      children: [
                      Image.asset('assets/images/img8.webp',
                        width:  MediaQuery.of(context).size.width*0.9,
                        height: MediaQuery.of(context).size.height*0.3,
                      ),
                        const Text(
                          'QuickMart',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color:mainColor,
                            fontFamily: 'BlackAndWhite',
                          ),
                        ),
                       SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01, right: MediaQuery.of(context).size.height*0.01),
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
                              hintText: "email",
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

                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.height*0.01, right: MediaQuery.of(context).size.height*0.01),
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
                            hintText: "password",
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
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                        Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        ElevatedButton(
                          onPressed:  () async {
                                dynamic result = await _auth
                                    .signInUsingEmailAndPassword(email, password);

                                if (result == null) {
                                  setState(() {
                                    error = "Could not signin with those credentials";
                                  });
                                }else{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
                                  );
                                }
                              },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height*0.1,vertical: MediaQuery.of(context).size.width*0.03, )
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        //anon
                      ],
                    ),
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