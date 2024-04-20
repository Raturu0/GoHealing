import 'package:flutter/material.dart';
import 'package:gohealing/User/widgets/Card/CardPopuler.dart';
import 'package:gohealing/User/widgets/Slider/SouvenirSlider.dart';
import 'package:gohealing/User/widgets/Slider/WisataSlider.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double Screen;
  TextEditingController searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Screen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Container(
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: Screen * (0.6),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              "assets/img/icon.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: Screen * (0.05),
                          ),
                          Text(
                            "GoHealing",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: Screen * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://awsimages.detik.net.id/community/media/visual/2019/02/19/42393387-9c5c-4be4-97b8-49260708719e.jpeg?w=600&q=90"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 75,
                child: TextField(
                  controller: searchC,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Cari di sini",
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    fillColor: Color(0xFF7E88E1),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Atur radius border di sini
                      borderSide: BorderSide.none, // Hilangkan border
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Text(
                "Ayo, Bawa Keluargamu Jalan-Jalan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            WisataSlider(
              gambar1:
                  "https://backoffice.konstruksiindo.id/images/posts/large/1689666990_bb8391f730ba479baf81.jpeg",
              tempatWisata1: "Candi Borobudur",
              jarak1: "112",
              harga1: "250.000",
              gambar2:
                  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/76/9a/93/dataran-tinggi-dieng.jpg?w=500&h=400&s=1",
              tempatWisata2: "Dieng Plateau",
              jarak2: "75",
              harga2: "20.000",
              gambar3:
                  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/75/9f/a8/2018-02-02-01-34-02-largejpg.jpg?w=500&h=400&s=1",
              tempatWisata3: "Gedung Lawang Sewu",
              jarak3: "10",
              harga3: "50.000",
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Text(
                "Temukan Souvenir Favoritmu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            SouvenirSlider(
              gambar1:
                  "https://1.bp.blogspot.com/--mOMBc-2lCA/XP8-5HxcS1I/AAAAAAABZVg/fSD2n_GPsJA5o536irWaUpyqdb6jNfbEwCLcBGAs/s1280/souvenir-gantungan-kunci-borobudur.jpg",
              namasouvenir1: "Gantungan Kunci Candi Borobudur",
              terjual1: "50",
              harga1: "20.000",
              gambar2:
                  "https://i0.wp.com/penginapandieng.net/wp-content/uploads/2017/06/purwaceng.jpg?w=720&ssl=1",
              namasouvenir2: "Purwaceng Khas Dieng",
              terjual2: "10",
              harga2: "30.000",
              gambar3:
                  "https://jejakpiknik.com/wp-content/uploads/2018/10/smg-4-1-630x380.jpg",
              namasouvenir3: "Gelas Miniatur Tugu Muda",
              terjual3: "20",
              harga3: "35.000",
            ),
            SizedBox(height: 50),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: "Populer"),
                      Tab(text: "Terdekat"),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: ListView(
                            children: [
                              CardPopuler(
                                Screen: Screen,
                                gambar:
                                    "https://backoffice.konstruksiindo.id/images/posts/large/1689666990_bb8391f730ba479baf81.jpeg",
                                jarak: "112",
                                harga: "250.000",
                                tempatWisata: "Candi Borobudur",
                              ),
                              CardPopuler(
                                Screen: Screen,
                                gambar:
                                    "https://www.nativeindonesia.com/foto/2022/10/surga-dunia.jpg",
                                jarak: "60",
                                harga: "20.000",
                                tempatWisata: "Gunung Sikunir",
                              ),
                              CardPopuler(
                                Screen: Screen,
                                gambar:
                                    "https://asset.kompas.com/crops/0nZi0OzF4llKf6pwzhfeQ9Fa7Xs=/4x0:997x662/750x500/data/photo/2022/06/06/629db5191baf7.jpg",
                                jarak: "59",
                                harga: "10.000",
                                tempatWisata: "Batu Raden",
                              ),
                              CardPopuler(
                                Screen: Screen,
                                gambar:
                                    "https://awsimages.detik.net.id/community/media/visual/2022/08/15/pantai-menganti-kebumen-pantai-seribu-pesona-3_169.jpeg?w=1200",
                                jarak: "24",
                                harga: "40.000",
                                tempatWisata: "Pantai Menganti",
                              ),
                              SizedBox(height: 100)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: ListView(
                            children: [
                              CardPopuler(
                                Screen: Screen,
                                gambar:
                                    "https://asset.kompas.com/crops/0nZi0OzF4llKf6pwzhfeQ9Fa7Xs=/4x0:997x662/750x500/data/photo/2022/06/06/629db5191baf7.jpg",
                                jarak: "59",
                                harga: "10.000",
                                tempatWisata: "Batu Raden",
                              ),
                              CardPopuler(
                                Screen: Screen,
                                gambar:
                                    "https://awsimages.detik.net.id/community/media/visual/2022/08/15/pantai-menganti-kebumen-pantai-seribu-pesona-3_169.jpeg?w=1200",
                                jarak: "24",
                                harga: "40.000",
                                tempatWisata: "Pantai Menganti",
                              ),
                              CardPopuler(
                                Screen: Screen,
                                gambar:
                                    "https://backoffice.konstruksiindo.id/images/posts/large/1689666990_bb8391f730ba479baf81.jpeg",
                                jarak: "112",
                                harga: "250.000",
                                tempatWisata: "Candi Borobudur",
                              ),
                              CardPopuler(
                                Screen: Screen,
                                gambar:
                                    "https://www.nativeindonesia.com/foto/2022/10/surga-dunia.jpg",
                                jarak: "60",
                                harga: "20.000",
                                tempatWisata: "Gunung Sikunir",
                              ),
                              SizedBox(height: 100)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
