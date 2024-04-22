import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:medheal/controller/user_provider.dart';
import 'package:medheal/widgets/normal_widgets.dart';
import 'package:medheal/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

class AllDoctorsScreen extends StatelessWidget {
  const AllDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          toolbarHeight: 100,
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * .02),
            child: CustomTextFormField(
              controller: userProvider.searchController,
              hintText: 'Search',
              // suffixIcon: Icon(EneftyIcons.filter_square_outline),
              prefixIcon: Icon(
                EneftyIcons.search_normal_2_outline,
                color: Color(0xFFB2BAC6),
              ),
            ),
          )),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              allDoctorsContainer(size, isAdmin: false),
              SizedBox(height: size.height * .02),
              allDoctorsContainer(size, isAdmin: false),
              SizedBox(height: size.height * .02),
              allDoctorsContainer(size, isAdmin: false),
              SizedBox(height: size.height * .02),
              allDoctorsContainer(size, isAdmin: false),
            ]),
          )),
    );
  }
}
