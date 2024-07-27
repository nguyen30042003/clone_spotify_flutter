import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/presentation/pages/get_started.dart';
import 'package:spotify/utils/configs/assets/app_vectors_and_images.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
            AppVectorsAndImages.getLinkVector('spotify_logo')
        ),
      ),
    );
  }
  Future<void> redirect() async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => GetStarted()));
  }
}
