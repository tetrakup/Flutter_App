/*import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/pp.png'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Serap & Ceylan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'serapceylan@gmail.com',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Orderlist'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Password'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('Discount Code'),
              onTap: () {
                // Handle the tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  String? _profileImagePath;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPath = prefs.getString('profile_image_path');

    if (savedPath != null) {
      if (kIsWeb) {
        setState(() {
          _profileImagePath = savedPath;
        });
      } else {
        setState(() {
          _profileImagePath = savedPath;
          _profileImage = File(savedPath);
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          _profileImagePath = pickedFile.path;
        });
        prefs.setString('profile_image_path', pickedFile.path);
      } else {
        final Directory appDir = await getApplicationDocumentsDirectory();
        final String filePath = path.join(appDir.path, 'profile_image.png');
        final File profileImageFile = File(filePath);
        await profileImageFile.writeAsBytes(await pickedFile.readAsBytes());

        setState(() {
          _profileImage = profileImageFile;
          _profileImagePath = profileImageFile.path;
        });

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('profile_image_path', profileImageFile.path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : (_profileImagePath != null
                              ? NetworkImage(_profileImagePath!)
                              : AssetImage('assets/images/pp.png')) as ImageProvider,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Serap & Ceylan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'serapceylan@gmail.com',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Orderlist'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Password'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('Discount Code'),
              onTap: () {
                // Handle the tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
