import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 56),
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.network(
                  'https://th.bing.com/th/id/R.f1ba520876b83961c74821caa437ab0e?rik=GBgPc6Z9uXqFRQ&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2fc%2fb%2fb%2f781700-luffy-wallpapers-2294x1633-download-free.jpg&ehk=NKUQXcPamkwRYnW%2bOYLdAzo2OYp8FsvkuYJTjvdx%2bgI%3d&risl=&pid=ImgRaw&r=0',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: const Text(
                'dIFTA',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'difta.fit2002@mail.ugn.ac.id',
                style: TextStyle(color: Colors.white54),
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}

//lets create a ui of account page