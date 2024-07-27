import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/app_bar_basic.dart';
import 'package:spotify/presentation/pages/profile.dart';
import 'package:spotify/presentation/widgets/get_play_list.dart';


import '../../utils/configs/assets/app_vectors_and_images.dart';
import '../../utils/configs/theme/app_colors.dart';
import '../widgets/new_songs.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBasic(
        hidden: true,
        action: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => const Profile())
              );
            },
            icon: const Icon(
                Icons.person
            )
        ),
        title: SvgPicture.asset(
            AppVectorsAndImages.getLinkVector('spotify_logo'),
            height: 40,
            width: 40,
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height / 4,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const NewSongs(),
                    Container(),
                    Container(),
                    Container()
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(5.0),
                child: GetPlayList(),
            )
            //const GetPlayList(),
          ]
        ),
      )
    );
  }

  Widget _homeTopCard(){
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                AppVectorsAndImages.getLinkVector('home_top_card')
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 60
                ),
                child: Image.asset(
                  AppVectorsAndImages.getLinkImage('home_artist')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs(){
    return TabBar(
      controller: _tabController,
      //isScrollable: true,
      //labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: const EdgeInsets.only(left: 0,top: 20,right: 0, bottom:  0),
      tabs: const [
        Text(
          'News',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        ),
        Text(
          'Podcasts',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        )
      ],
    );
  }
}
