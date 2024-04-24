import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/controller/user_provider.dart';
import 'package:medheal/widgets/textformfield_widget.dart';

const double circleAvatarRadiusFraction = 0.1;

class AllDoctorsScreen extends StatelessWidget {
  const AllDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double circleAvatarRadius = size.shortestSide * circleAvatarRadiusFraction;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          toolbarHeight: 100,
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * .02),
            child: CustomTextFormField(
              controller: userProvider.searchController,
              hintText: 'Search',
              prefixIcon: const Icon(
                EneftyIcons.search_normal_2_outline,
                color: Color(0xFFB2BAC6),
              ),
              suffixIcon: const Icon(
                EneftyIcons.firstline_outline,
                color: Color(0xFF1995AD),
              ),
            ),
          )),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(children: [
                allDoctorsContainer(size,
                    isAdmin: false, circleAvatarRadius: circleAvatarRadius),
                SizedBox(height: size.height * .02),
              ]);
            },
          )),
    );
  }
}
