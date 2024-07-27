
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button.dart';
import 'package:spotify/presentation/pages/choose_mode.dart';
import 'package:spotify/presentation/pages/splash.dart';
import 'package:spotify/utils/configs/assets/app_vectors_and_images.dart';

import '../../utils/configs/theme/app_colors.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 40
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectorsAndImages.getLinkVector('spotify_logo'))
                ),
                Spacer(),
                Text(
                  'Enjoy Listening to Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
                const SizedBox(height: 21,),
                const Text( 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
                    'tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 13
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Button(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const ChooseMode()
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
