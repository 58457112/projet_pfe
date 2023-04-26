import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Container(
                  color: Colors.white.withOpacity(0.95),
                  child: Image(
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/90/7f/f2/907ff2406900b0d246924c1539ae9bc5.jpg')),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Forget Password ?',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please enter your registered email address we will get back to you with the reset password link and confirmation ...thanks',
                textAlign: TextAlign.center,
              ),
              TextFormField(
                // controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Entrez votre e-mail',
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
