import 'package:flutter/material.dart';
import 'package:myanimeapp/Providers/Page/auth/login_page.dart';
import 'package:myanimeapp/components/button/setting_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      'https://th.bing.com/th/id/R.f1ba520876b83961c74821caa437ab0e?rik=GBgPc6Z9uXqFRQ&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2fc%2fb%2fb%2f781700-luffy-wallpapers-2294x1633-download-free.jpg&ehk=NKUQXcPamkwRYnW%2bOYLdAzo2OYp8FsvkuYJTjvdx%2bgI%3d&risl=&pid=ImgRaw&r=0',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  'Difta Fitrahul Qihaj',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'difta.fit2002@mail.ugm.ac.id',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text('Upgrade to Pro',
                        style: TextStyle(color: Colors.black)),
                  )),
              SettingButton(
                  function: () {},
                  leadingIcon: Icons.privacy_tip_outlined,
                  text: 'Privacy'),
              SettingButton(
                  function: () {}, leadingIcon: Icons.history, text: 'History'),
              SettingButton(
                  function: () {},
                  leadingIcon: Icons.help_outline_outlined,
                  text: 'Help & Support'),
              SettingButton(
                  function: () {},
                  leadingIcon: Icons.settings,
                  text: 'Settings'),
              SettingButton(
                  function: () {},
                  leadingIcon: Icons.send_and_archive_rounded,
                  text: 'Invite a Frind'),
              SettingButton(
                  function: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                  leadingIcon: Icons.logout,
                  text: 'Logout'),
            ],
          ),
        ),
      ),
    );
  }
}

//lets create a ui of account page