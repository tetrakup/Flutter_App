import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  String? _profileImagePath;
  String? _base64Image;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPath = prefs.getString('profile_image_path');
    String? base64Image = prefs.getString('profile_image_base64');

    if (kIsWeb) {
      if (base64Image != null) {
        setState(() {
          _base64Image = base64Image;
        });
      }
    } else {
      if (savedPath != null) {
        setState(() {
          _profileImagePath = savedPath;
          _profileImage = File(savedPath);
        });
      }
    }
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        final base64Image = base64Encode(bytes);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          _base64Image = base64Image;
        });
        prefs.setString('profile_image_base64', base64Image);
      }
    } else {
      var status = await Permission.photos.status;

      if (status.isDenied || status.isPermanentlyDenied) {
        status = await Permission.photos.request();
      }

      if (status.isGranted) {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
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
      } else {
        setState(() {
          _profileImagePath = null;
          _profileImage = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Galeri erişimi reddedildi.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;
    if (kIsWeb) {
      if (_base64Image != null) {
        imageProvider = MemoryImage(base64Decode(_base64Image!));
      }
    } else {
      if (_profileImage != null) {
        imageProvider = FileImage(_profileImage!);
      } else if (_profileImagePath != null) {
        imageProvider = FileImage(File(_profileImagePath!));
      }
    }
    imageProvider ??= AssetImage('assets/images/pp.png');

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
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: imageProvider,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Resmi Değiştir'),
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
