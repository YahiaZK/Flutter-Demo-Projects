import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Profile UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_rounded)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('lib/Assets/IMG_0330.JPG'),
              ),
              SizedBox(height: 15),
              Text(
                'Yahia Mohammad',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 3),
              Text(
                'Mobile Flutter Developer',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Text(
                'Complete your profile ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '(1/5)',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: List.generate(5, (index) {
              return Expanded(
                child: Container(
                  height: 7,
                  margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ? Colors.blue : Colors.black12,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: 180,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletetionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(card.icon, size: 30),
                          Text(card.title, textAlign: TextAlign.center),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(card.buttonText),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletetionCards.length,
            ),
          ),
          SizedBox(height: 25),
          ...List.generate(customListTiles.length, (index) {
            final tile = customListTiles[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(tile.icon),
                  title: Text(tile.title),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            );
          }),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class ProfileCompletionCard {
  final IconData icon;
  final String title;
  final String buttonText;
  ProfileCompletionCard({
    required this.icon,
    required this.title,
    required this.buttonText,
  });
}

List<ProfileCompletionCard> profileCompletetionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;

  CustomListTile({required this.icon, required this.title});
}

List<CustomListTile> customListTiles = [
  CustomListTile(icon: Icons.insights, title: "Activity"),
  CustomListTile(icon: Icons.location_on_outlined, title: "Location"),
  CustomListTile(title: "Notifications", icon: CupertinoIcons.bell),
  CustomListTile(title: "Logout", icon: CupertinoIcons.arrow_right_arrow_left),
];
