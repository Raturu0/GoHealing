import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gohealing/User/BottomConvexBarr/BottomConvexBarr.dart';
import 'package:gohealing/User/pages/LoginPage/LoginPage.dart';
import 'package:gohealing/User/widgets/shapeOfLogin.dart';
import 'package:gohealing/data/UserData.dart';
import 'package:gohealing/providers/FirebaseAuthService.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameC = TextEditingController();
  TextEditingController _emailC = TextEditingController();
  TextEditingController _passC = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    _usernameC.dispose();
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 5, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'GOHEALING',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  ),
                ),
                SizedBox(height: 40),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(
                        1000,
                        (900 * 0.5833333333333334).toDouble(),
                      ),
                      painter: RPSCustomPainter(),
                    ),
                    Positioned(
                      top: 30,
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img/icon.jpg')),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100,
                          padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                          child: TextField(
                            controller: _usernameC,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Username",
                              hintText: 'Masukkan Username Anda',
                              hintStyle: TextStyle(fontStyle: FontStyle.italic),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.person),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                          width: double.infinity,
                          height: 50,
                          child: TextField(
                            controller: _emailC,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Email",
                              hintText: 'Masukkan Email Anda',
                              hintStyle: TextStyle(fontStyle: FontStyle.italic),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.email),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 80,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            controller: _passC,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: obscurePassword, // Gunakan state ini di sini
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Password",
                              hintText: 'Masukkan Password ',
                              hintStyle: TextStyle(fontStyle: FontStyle.italic),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.key),
                              suffixIcon: IconButton(
                                icon: Icon(obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    obscurePassword = !obscurePassword;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 30,
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF2839CD),
                            ),
                            onPressed: () {
                              // Panggil metode _signUp
                              _signUp();
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String email = _emailC.text;
    String password = _passC.text;

    // Simpan nilai username
    UserData.username = _usernameC.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print("user success created");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } else {
      print("some error");
    }
  }
}
