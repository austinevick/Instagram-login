import 'package:flutter/material.dart';
import 'package:instagram_login/instagram_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text('Welcome, login to continue',
                      style: TextStyle(fontSize: 20))),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: 55,
                width: 250,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => InstagramView()));
                    },
                    child: Text('Login with instagram')),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
