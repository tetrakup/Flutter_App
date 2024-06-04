import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vizeproje/services/auth_service.dart';
import 'package:vizeproje/models/user.dart';

class KayitScreen extends StatefulWidget {
  const KayitScreen({Key? key}) : super(key: key);

  @override
  _KayitScreenState createState() => _KayitScreenState();
}

class _KayitScreenState extends State<KayitScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Üye Ol")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/logo.png', height: 120.0),
                const SizedBox(height: 40.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
                  onSaved: (value) => _email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen e-mail adresinizi girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                  onSaved: (value) => _password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen şifrenizi girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16.0)),
                  child: const Text('Üye Ol', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      User newUser = User(email: _email!, password: _password!); // Nullable değerleri kesin olarak atayın
      _authService.register(newUser).then((user) {
        if (user != null) {
          GoRouter.of(context).replace('/giris');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kayıt başarısız')));
        }
      });
    }
  }
}
