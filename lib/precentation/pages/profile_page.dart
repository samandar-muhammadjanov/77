// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/widgets/profile_widgets/profile_page_body.dart';
import 'package:hakaton_uic/precentation/widgets/profile_widgets/profile_page_header.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0.4,
        title: SvgPicture.asset("assets/svg/logo.svg"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: SvgPicture.asset("assets/svg/logout.svg"),
          )
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthLoaded) {
            return const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProfileHeader(),
                  ProfileBody(),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _logout(BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();
      context.read<AuthBloc>().add(AuthinticatedEvent(false));
    } catch (e) {
      print(e);
    }
  }
}
