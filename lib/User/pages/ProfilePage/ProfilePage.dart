import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:gohealing/Developer/Manual/Developerr.dart";
import "package:gohealing/User/pages/LoginPage/LoginPage.dart";
import 'package:gohealing/User/widgets/shapeOfProfile.dart';
import 'package:gohealing/User/widgets/NamaProfil.dart';
import 'package:gohealing/User/widgets/OutputProfile.dart';
import 'package:gohealing/data/UserData.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
        // Mendapatkan pengguna saat ini
    User? user = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * (0.06),
          right: MediaQuery.of(context).size.width * (0.06),
          top: 40),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 60,
            width: MediaQuery.of(context).size.width * (0.94),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF2839CD),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * (0.03),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xFF2839CD),
                  child: Icon(
                    Icons.headset_mic,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * (0.4),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          print("klik developer");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Developerr(),
                              ));
                        },
                        icon: Icon(
                          Icons.developer_mode,
                          color: Colors.green[900],
                        )),
                    IconButton(
                        onPressed: () {
                          print("klik logout");
                          FirebaseAuth.instance.signOut();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        icon: Icon(Icons.logout))
                  ],
                )
              ],
            ),
          ),
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
                top: 20, // Sesuaikan nilai ini sesuai kebutuhan
                child: Container(
                  width: 125,
                  height: 125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://awsimages.detik.net.id/community/media/visual/2019/02/19/42393387-9c5c-4be4-97b8-49260708719e.jpeg?w=600&q=90")),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 140),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NamaProfil(text: 'Nama'),
                    OutputProfile(text: UserData.username),
                    SizedBox(
                      height: 10,
                    ),
                    NamaProfil(text: 'Bio'),
                    OutputProfile(
                        text:
                            'Yang penting win streak. Bismillah glory berkah'),
                    SizedBox(
                      height: 10,
                    ),
                    NamaProfil(text: 'Nomor Handphone'),
                    OutputProfile(text: '0857 - 9876 - 9325'),
                    SizedBox(
                      height: 10,
                    ),
                    NamaProfil(text: 'Alamat E-mail'),
                    OutputProfile(text: '${user?.email ?? "N/A"}'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.topLeft,
                      child: Text('Alamat'),
                    ),
                    OutputProfile(
                      text:
                          'Jl. Kaliurang No 10, Gondangan, Sardonoharjo, Ngaglik, Sleman, DIY',
                      tinggi: 60.0,
                      jarak: 6.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {},
                  child: Container(
                    child: Text(
                      'Ubah Profil',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {},
                  child: Container(
                    child: Text(
                      'Bergabung dengan GOHEALING',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
