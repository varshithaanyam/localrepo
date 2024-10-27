// ignore_for_file: avoid_print, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rough_code/accsettings.dart';
import 'package:rough_code/chat.dart';
import 'package:rough_code/createproduct.dart';
import 'package:rough_code/guide.dart';
import 'package:rough_code/notifications.dart';
import 'package:rough_code/registration.dart';
import 'package:rough_code/saved.dart';
import 'package:rough_code/signin.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBl1rswjkfnfWwq_fsjjiPR5RtDZVlulZ0",
        authDomain: "metasphere-31e06.firebaseapp.com",
        projectId: "metasphere-31e06",
        storageBucket: "metasphere-31e06.appspot.com",
        messagingSenderId: "259271451795",
        appId: "1:259271451795:web:b6303d02c70f97e7b5d966",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Widget028(),
    );
  }
}

class Widget028 extends StatefulWidget {
  // ignore: use_super_parameters
  const Widget028({Key? key}) : super(key: key);

  @override
  State<Widget028> createState() => _Widget028State();
}

class _Widget028State extends State<Widget028> {
  int _selectedIndex = 0;
  int _currentIndex = 0;

  final List<String> carouselImgList = [
    'assets/1st image.png',
    'assets/2nd image.jpeg',
    'assets/3rd image.jpg',
    'assets/4th image.jpg',
    'assets/5th image.webp',
  ];

  final List<String> verticalImgList = [
    'assets/6th image.jpeg',
    'assets/7th image.png',
    'assets/8th image.jpg',
    'assets/9th image.jpeg',
    'assets/10th image.jpeg',
  ];

  final CarouselController _carouselController = CarouselController();

  void _onCarouselChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(26, 35, 126, 1)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => signin()));
          },
        ),
        centerTitle: true,
        title: const Text(
          'Metasphere',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 12, 19, 103),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.indigo[900],
            onPressed: () {
              print('Search icon pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.indigo[900],
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
              print('Notification icon pressed');
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Carousel Slider
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: carouselImgList.length,
                itemBuilder: (context, index, realIndex) {
                  final imgPath = carouselImgList[index];
                  double scale = (index == 0 || index == 4) ? 1.1 : 1.0; // Zoom for 1st and 5th images
                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFA1A4B0), width: 2.5),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1.0),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(3, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: _onCarouselChanged,
                ),
              ),
            ),

            // Dot Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(carouselImgList.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  width: 8.0, // Smaller width for dots
                  height: 8.0, // Smaller height for dots
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.indigo : Colors.grey,
                    border: Border.all(
                      color: _currentIndex == index ? Colors.white : Colors.transparent,
                      width: 1.5, // Slightly thinner border
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Vertically scrollable images with icon buttons below
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: verticalImgList.length,
              itemBuilder: (context, i) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  child: Column(
                    children: [
                      // Image container
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: Image.asset(
                            verticalImgList[i],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Container with icons
                      Container(
                        width: double.infinity,
                        color: const Color(0xFFEBEAF1),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite),
                              color: Colors.red,
                              onPressed: () {
                                print('Heart pressed on image $i');
                              },
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const Icon(Icons.chat),
                              color: Colors.green,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const chat()));
                                print('Chat pressed on image $i');
                              },
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const Icon(Icons.save),
                              color: Colors.orange,
                              onPressed: () {
                                print('Save pressed on image $i');
                              },
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const Icon(Icons.info),
                              color: Colors.purple,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                                print('Info pressed on image $i');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo[900],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => accsettings()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Saved()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Createproduct()));
              break;
            case 4:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Guide()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Save'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.tips_and_updates), label: 'Tips'),
        ],
        selectedItemColor: Colors.indigo[900],
        unselectedItemColor: Colors.indigo[200],
      ),
    );
  }
}
