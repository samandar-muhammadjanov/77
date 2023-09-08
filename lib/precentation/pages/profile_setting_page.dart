import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/domain/models/user_model.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/extansions.dart';
import 'package:shimmer/shimmer.dart';

class ProfileSettingPage extends StatelessWidget {
  const ProfileSettingPage({super.key});
  static const routeName = "/profile/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: SvgPicture.asset("assets/svg/logo.svg"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svg/ru.svg"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset("assets/svg/arrow-left.svg")),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Персональные данные",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 24.5,
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserError) {
                  return Text(state.error);
                }
                if (state is UserLoaded) {
                  final data = state.userData;
                  return UserDatas(
                    userData: data,
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: kFillColor),
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: kFillColor),
                              borderRadius: BorderRadius.circular(8)),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 30,
                                            spreadRadius: 0,
                                            color:
                                                kDarkGreyColor.withAlpha(180))
                                      ],
                                      color: kDarkGreyColor,
                                      border: Border.all(color: kWhite),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 20,
                                  width: 100,
                                  color: kWhite,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class UserDatas extends StatelessWidget {
  const UserDatas({super.key, required this.userData});
  final UserData userData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: kFillColor),
          borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 30,
                    spreadRadius: 0,
                    color: kDarkGreyColor.withAlpha(180))
              ],
              color: kDarkGreyColor,
              border: Border.all(color: kWhite),
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                userData.profilePhoto,
                width: 54,
                height: 54,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            userData.fullName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: kElevatedButtonColor,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/svg/phone-call-01.svg"),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  userData.phoneNumber.formatPhoneNumberWithSpaces(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: kElevatedButtonColor,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/svg/email.svg"),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  userData.email,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kFillColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: kElevatedButtonColor,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/location-01.svg",
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    userData.address.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
