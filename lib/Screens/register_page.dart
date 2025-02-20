import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void signUserUp() async{
    if(_confirmPasswordController.text == _passwordController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }else{
      showErrorMessage('Passwords Do not Match');
    }
  }

  void showErrorMessage(String message){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          );
        }
    );
  }

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
      signUserUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                  'Lets Create an Account!',
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
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: _passwordError,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Confirm Password Text Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      errorText: _passwordError,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
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
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5),

                // Register Now
                register(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget register(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.bold)),
        GestureDetector(
            onTap: widget.onTap,
            child: Text(
                ' Login Now',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)
            )),
      ],
    );
  }

}
