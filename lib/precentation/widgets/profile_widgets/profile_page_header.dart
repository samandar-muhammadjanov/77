import 'package:flutter/material.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(GetUserDataEvent(context)),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return Container(
              padding: const EdgeInsets.all(12),
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
                        state.userData.profilePhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    state.userData.fullName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            );
          }
          return Container(
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
                              color: kDarkGreyColor.withAlpha(180))
                        ],
                        color: kDarkGreyColor,
                        border: Border.all(color: kWhite),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
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
          );
        },
      ),
    );
  }
}
