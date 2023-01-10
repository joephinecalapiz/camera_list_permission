import 'package:camera_list_permission/pages/gallery-page.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile Picture")
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 1),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: bottom),
                color: Colors.orangeAccent,
                child: Image.network('https://wallpapercave.com/uwp/uwp3151104.png',
                    width: double.infinity,
                    height: coverHeight,
                    fit: BoxFit.cover),
              ),

              Positioned(
                top: top,
                child: const CircleAvatar(
                  radius: 70,
                  child: CircleAvatar(
                    radius: 135,
                    backgroundImage: AssetImage('assets/images/jopin.jpg'),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 100,
                child: IconButton(
                  onPressed: goToGallery,
                  icon: const Icon(
                    Icons.add_a_photo_sharp,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 30,
                child: Text(
                    "Joephine Calapiz",
                    style: TextStyle(
                        height: 4,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    )),
              )
            ],
          ),
          const SizedBox(height: 4),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
                onPressed: goToGallery,
                icon: const Icon(Icons.add_a_photo_sharp),
                label: const Text('UPDATE IMAGE')),
          ),
        ],
      ),
    );
  }
  void goToGallery() {
    final route = MaterialPageRoute(builder: (context) => const HomePage());
    Navigator.push(context, route);
  }

}
