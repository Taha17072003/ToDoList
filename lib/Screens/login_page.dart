import 'package:flutter/material.dart';
import 'Home_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  // ✅ Function to validate email format
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  // ✅ Function to validate user input
  void validateAndLogin() {
    setState(() {
      _emailError = null;
      _passwordError = null;

      if (_emailController.text.isEmpty || !isValidEmail(_emailController.text)) {
        _emailError = "Enter a valid email!";
      }

      if (_passwordController.text.isEmpty) {
        _passwordError = "Password cannot be empty!";
      }
    });

    // ✅ Proceed only if there are no errors
    if (_emailError == null && _passwordError == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.library_books, size: 100),
              Text(
                'ToDoList',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to ToDoList App!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 30),

              // ✅ Email Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    errorText: _emailError,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),

              SizedBox(height: 10),

              // ✅ Password Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText: _passwordError,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),

              SizedBox(height: 5),

              // Forget Password
              Container(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,

                        ),
                        Text('Show Password'),
                      ],
                    ),
                    Text('Forget Password?', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // ✅ Sign In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: validateAndLogin, // 🔥 Calls validation function
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),

              // Register Now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(' Register Now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
