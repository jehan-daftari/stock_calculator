import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  User? user = await authService.signInWithEmailAndPassword(
                    _emailController.text,
                    _passwordController.text,
                  );
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    setState(() {
                      errorMessage = 'Invalid email or password';
                    });
                  }
                } on FirebaseAuthException catch (e) {
                  print('FirebaseAuthException: ${e.code} - ${e.message}');
                  setState(() {
                    if (e.code == 'user-not-found') {
                      errorMessage = 'No user found for that email.';
                    } else if (e.code == 'wrong-password') {
                      errorMessage = 'Wrong password provided for that user.';
                    } else {
                      errorMessage = 'Error: ${e.message}';
                    }
                  });
                } catch (e) {
                  print('Error: $e');
                  setState(() {
                    errorMessage = 'Error: $e';
                  });
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () async {
                User? user = await authService.signInWithGoogle();
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  setState(() {
                    errorMessage = 'Error signing in with Google';
                  });
                }
              },
              child: Text('Sign in with Google'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text('Sign Up'),
            ),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
