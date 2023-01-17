import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'main.dart';

Widget _buildBottomNav() {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    height: 90,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    decoration: BoxDecoration(
      color: Color(0xff1d1f21),
      borderRadius: const BorderRadius.all(Radius.circular(30)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.home_outlined),
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(5),
          child: Icon(
            Icons.add_circle_outline,
            color: Color(0xff1d1f21),
          ),
          decoration: const BoxDecoration(
            color: Color(0xff1d1f21),
            shape: BoxShape.circle,
          ),
        ),
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {},
        ),
      ],
    ),
  );
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1d1f21),
      ),
      bottomNavigationBar: _buildBottomNav(),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: ContactUs(
        taglineColor: Color.fromARGB(255, 255, 255, 255),
        companyColor: Color.fromARGB(255, 255, 255, 255),
        cardColor: Color.fromARGB(255, 255, 0, 0),
        textColor: Color.fromARGB(255, 255, 255, 255),
        logo: AssetImage('assets/extra/tlogo.png'),
        email: 'SneakCrib@gmail.com',
        companyName: 'SneakCrib',
        phoneNumber: '+021234567890',
        dividerThickness: 2,
        githubUserName: 'sneakercrib',
        tagLine: 'Sneaker Store',
      ),
    );
  }
}
