import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/app_bar_basic.dart';
import 'package:spotify/common/widgets/button.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/domain/usecases/signup.dart';
import 'package:spotify/presentation/pages/homepage.dart';
import 'package:spotify/presentation/pages/signin.dart';
import 'package:spotify/utils/configs/assets/app_vectors_and_images.dart';

import '../../service_locator.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: AppBarBasic(
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30
        ),
        child: Column(
          children: [
            _registerText(),
            const SizedBox(height: 50,),
            _fullNameField(context),
            const SizedBox(height: 50,),
            _emailField(context),
            const SizedBox(height: 50,),
            _passwordField(context),
            const SizedBox(height: 50,),
            Button(title: 'Create account',
                onPressed: () async{
                  var result = await sl<SignupUseCase>().call(
                    params: CreateUserReq(
                        fullName: _fullName.text.toString(),
                        email: _email.text.toString(),
                        password: _password.text.toString())
                  );
                  result.fold(
                          (l){
                        var snackbar = SnackBar(content: Text(l),behavior: SnackBarBehavior.floating,);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                          (r){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => const Homepage()),
                                (route) => false
                        );
                      }
                  );
                }
            )
            
          ],
        ),
      ),
    );
  }
  Widget _registerText(){
    return const Text(
      'Register',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
          hintText: 'Full Name'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
          hintText: 'Email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
          hintText: 'Password'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Text(
            'Do you have an account? ',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
          ),
          TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Signin()
                    )
                );
              },
              child: const Text(
                  'Sign In',
                style: TextStyle(
                  color: Colors.blue
                ),
              )
          )
        ],
      ),
    );
  }
}
