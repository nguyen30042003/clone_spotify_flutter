import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/app_bar_basic.dart';
import 'package:spotify/common/widgets/button.dart';
import 'package:spotify/data/models/signin_user_req.dart';
import 'package:spotify/domain/usecases/signin.dart';
import 'package:spotify/presentation/pages/signup.dart';
import 'package:spotify/utils/configs/assets/app_vectors_and_images.dart';

import '../../service_locator.dart';
import 'homepage.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: AppBarBasic(
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30
        ),
        child: Column(
          children: [
            _loginText(),
            const SizedBox(height: 50,),
            _emailField(context),
            const SizedBox(height: 50,),
            _passwordField(context),
            const SizedBox(height: 50,),
            Button(title: 'Create account',
                onPressed: () async{
                  var result = await sl<SigninUsecase>().call(
                      params: SigninUserReq(
                          email: _email.text.toString(),
                          password: _password.text.toString()
                      )
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
  Widget _loginText(){
    return const Text(
      'Login',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36
      ),
      textAlign: TextAlign.center,
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
  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a account? ',
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
                        builder: (BuildContext context) => Signup()
                    )
                );
              },
              child: const Text(
                'Sign Up',
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
