import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button.dart';
import 'package:spotify/presentation/pages/signin_or_signup.dart';
import 'package:spotify/presentation/pages/splash.dart';
import 'package:spotify/utils/configs/assets/app_vectors_and_images.dart';

import '../../utils/configs/theme/app_colors.dart';
import '../bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 40
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppVectorsAndImages.getLinkImage('intro_bg'),
                    ),
                  )
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.40),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 80,
                  horizontal: 40
              ),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(AppVectorsAndImages.getLinkVector('spotify_logo'))
                  ),
                  const Spacer(),
                  const Text(
                    'Choose Mode',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter:  ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color:  const Color(0xff30393C).withOpacity(0.5),
                                    shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectorsAndImages.getLinkVector('moon'),
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          const Text(
                            'Dark Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColors.grey
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 50,),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter:  ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color:  const Color(0xff30393C).withOpacity(0.5),
                                      shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectorsAndImages.getLinkVector('sun'),
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          const Text(
                            'Light Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: AppColors.grey
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Button(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const SigninOrSignup()
                            )
                        );
                      },
                      title: 'Get Started'
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
