import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool passwordVisible = true;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController cpasswordcontroller = TextEditingController();

void CreateAccount() async{
  String email = emailcontroller.text.trim();
  String password = passwordcontroller.text.trim();
  String cpassword = cpasswordcontroller.text.trim();

  if(email.isEmpty || password.isEmpty || cpassword.isEmpty){

    print("please fill all the details" );
  }
  else if(password != cpassword){
    print('password do not match');
  }else{
    print('=====-----email: $email');
    print('=====-----email: $password');
    print('=====-----email: $cpassword');
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WelCome ! ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 40,
                          color: Color(0xff583732),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign up to Get Started.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xff583732),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35, right: 35, top: 40, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xff583732),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color(0xff583732),
                                )),
                            hintText: 'fahad123@gamil.com',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xff583732)),
                            ),
                            filled: true,
                          ),
                          // validator: (val) {
                          //   if (val.length == 0) {
                          //     return "Email cannot be empty";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                              fontFamily: "Poppins", color: Color(0xff583732)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35,bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PassWord',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xff583732),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextField(
                          controller: passwordcontroller,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(width: 2, color: Color(0xff583732)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color(0xff583732),
                                )),
                            hintText: '********',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                  () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                            alignLabelWithHint: false,
                            filled: true,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          style: new TextStyle(
                              fontFamily: "Poppins", color: Color(0xff583732)),
                          //fillColor: Colors.green
                          // validator: (val) {
                          //   if (val.length == 0) {
                          //     return "Email cannot be empty";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PassWord',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xff583732),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextField(
                          controller: cpasswordcontroller,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(width: 2, color: Color(0xff583732)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color(0xff583732),
                                )),
                            hintText: '********',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(
                                      () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                            alignLabelWithHint: false,
                            filled: true,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          style: new TextStyle(
                              fontFamily: "Poppins", color: Color(0xff583732)),
                          //fillColor: Colors.green
                          // validator: (val) {
                          //   if (val.length == 0) {
                          //     return "Email cannot be empty";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Color(0xff583732),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/google.png'),
                        iconSize: 50),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/apple.png'),
                        iconSize: 50),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/email.png'),
                        iconSize: 50),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: InkWell(
                    onTap: () {
                      CreateAccount();
                    },
                    child: Container(
                      width: 400,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff583732),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: ' Already Have an Account ?',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xff131a2e),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\n Log in ',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Color(0xff131a2e),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
