import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/widgets/normal_widgets.dart';

const double circleAvatarRadiusFraction = 0.1;

class FavouriteDoctorsScreen extends StatelessWidget {
  const FavouriteDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: poppinsHeadText(text: 'Favourite', fontSize: 20),
          automaticallyImplyLeading: false,
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                allDoctorsContainer(size,
                    isAdmin: false, circleAvatarRadius: circleAvatarRadius),
                SizedBox(height: size.height * .02)
              ],
            );
          },
        ),
      ),
    );
  }
}
