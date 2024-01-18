import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gohealing/User/BottomConvexBarr/BottomConvexBarr.dart';
import 'package:gohealing/User/pages/RegisterPage/RegisterPage.dart';
import 'package:gohealing/User/widgets/shapeOfLogin.dart';
import 'package:gohealing/providers/FirebaseAuthService.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailC = TextEditingController();
  TextEditingController _passC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  Color textColor = Colors.black;

  void changeColor() {
    setState(() {
      textColor = Colors.red;
    });

    // Delay 1 detik dan kembalikan warna ke biru
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        textColor = Colors.black;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
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
                          padding:
                              EdgeInsets.only(top: 30, left: 10, right: 10),
                          width: double.infinity,
                          height: 80,
                          child: TextField(
                            controller: _emailC,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Email",
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
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 80,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            controller: _passC,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true, // Set input password
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(Icons.key),
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
                      right: 10,
                      bottom: 180,
                      child: GestureDetector(
                        onTap: () {
                          // Aksi yang ingin diambil saat teks diklik
                          changeColor();
                          // TODO: Implementasi reset password
                          // Anda dapat menambahkan fungsi untuk mengatur ulang kata sandi di sini
                        },
                        child: Text(
                          'Lupa password ?',
                          style: TextStyle(
                              color: textColor,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
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
                              print("Login button pressed");
                              _signIn();
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
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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

  void _signIn() async {
    String email = _emailC.text;
    String password = _passC.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      print("user success sign in");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomConvexBarr(),
        ),
      );
    } else {
      print("some ror sign");
    }
  }
}
