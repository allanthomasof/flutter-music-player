import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              flex: 11,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Good evening",
                  style: TextStyles.titleHomeSection,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(Icons.settings),
            )
          ],
        ),
      ),
      body: Column(
        children: const [
          TopArtists(),
          RecentlyPlayed(),
        ],
      ),
    );
  }
}

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 35, left: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                "Recently Played",
                style: TextStyles.titleHomeSection,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 100,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.artistMedium,
                      height: 100,
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Dance Gavin Dance",
                        style: TextStyles.artistNameSmall,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TopArtists extends StatelessWidget {
  const TopArtists({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 128),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color(0xFF564843), Colors.black],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        width: size.width,
        child: Column(
          children: [
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Row(
                  children: const [
                    SmallCardArtist(),
                    SizedBox(width: 7),
                    SmallCardArtist()
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class SmallCardArtist extends StatelessWidget {
  const SmallCardArtist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: AppColors.grey,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
              child: Image.asset(
                AppImages.artistSmall,
                height: 60,
                width: 60,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 7, right: 5),
                child: Text(
                  "Machine Gun Kelly",
                  style: TextStyles.musicName,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
