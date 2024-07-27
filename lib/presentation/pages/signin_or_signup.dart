import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/app_bar_basic.dart';
import 'package:spotify/common/widgets/button.dart';
import 'package:spotify/presentation/pages/signin.dart';
import 'package:spotify/presentation/pages/signup.dart';
import 'package:spotify/utils/configs/assets/app_vectors_and_images.dart';

import '../../utils/configs/theme/app_colors.dart';
import 'choose_mode.dart';

class SigninOrSignup extends StatelessWidget {
  const SigninOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBarBasic(),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectorsAndImages.getLinkVector('bottom_pattern'),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectorsAndImages.getLinkVector('top_pattern'),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                AppVectorsAndImages.getLinkImage('auth_bg'),
              )
          ),
           Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(AppVectorsAndImages.getLinkVector('spotify_logo'))
                  ),
                   SizedBox(
                    height:  50,
                  ),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 21,),
                  const Text(
                    'Spotify a proprietary Swedish audio streaming and media services peovider',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.grey
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Button(title: 'Register',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Signup()
                                )
                            );
                          },),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context)=> Signin()
                                  )
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: context.checkDarkMode ? Colors.white : Colors.black
                              ),
                            )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
