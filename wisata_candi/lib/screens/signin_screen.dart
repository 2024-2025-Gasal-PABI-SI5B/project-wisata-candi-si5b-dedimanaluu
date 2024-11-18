import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SigninScreen extends StatefulWidget{
  SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // TODO: 1. Deklarasikan variable
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignIn  = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang Appbar
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      // TODO: 3. Pasang Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                // TODO: 4. Atur main AxisAligment  dan CrossAligment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO: 5. Buat TextFromField untuk nama pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      hintText: 'Masukkan Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO: 6. Buat TextFromField untuk kata sandi
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan Kata Sandi',
                      border: const OutlineInputBorder(),
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obscurePassword =!_obscurePassword;
                          });
                        }, 
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                  // TODO: 7. Buat ElevatedButton untuk signin
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Text('Sign In'),
                  ),
                  // TODO: 8. Pasang TextButton untuk SignUp
                  const SizedBox(height: 10),
                  // TextButton(onPressed: (){}, 
                  // child: Text('Belum punya akun? Daftar disini'),
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun?',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple
                      ),
                      children: [
                        TextSpan(
                          text: 'Daftar disini',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = (){},
                        )
                      ]
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}