import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vizeproje/services/auth_service.dart';

class giris extends StatefulWidget {
  const giris({Key? key}) : super(key: key);

  @override
  _girisState createState() => _girisState();
}

class _girisState extends State<giris> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/logo.png', height: 120.0),
                SizedBox(height: 40.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
                  onSaved: (value) => _email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen e-mail adresinizi girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                  onSaved: (value) => _password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen şifrenizi girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16.0)),
                  child: Text('Giriş Yap', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                ),
                SizedBox(height: 12.0),
                TextButton(
                  onPressed: () {},
                  child: Text('Şifremi Unuttum', style: TextStyle(color: Colors.grey)),
                ),
                SizedBox(height: 12.0),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).replace('/kayit');
                  },
                  child: Text('Hemen Üye Ol', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _authService.yeniApiLogin(_email!, _password!).then((user) {
        if (user != null) {
          GoRouter.of(context).replace('/homepage');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Giriş başarısız')));
        }
      });
    }
  }
}
