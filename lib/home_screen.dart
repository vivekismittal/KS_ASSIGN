import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ks_assign/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Welcome,',
                  style: const TextStyle(fontSize: 24),
                  children: [
                    TextSpan(
                        text: activeUser.name.split(' ')[0],
                        style: const TextStyle(fontStyle: FontStyle.italic,fontSize: 16)),
                  ],
                ),
              ),
              Text(
                '+91 ${activeUser.mobile}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.amber,
                  child: Text(
                    activeUser.name[0].toUpperCase(),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: SizedBox.square(
              dimension: MediaQuery.of(context).size.width,
              child: LottieBuilder.asset(
                'lottieFiles/629-empty-box.json',
                width: double.infinity,
              )),
        ));
  }
}
