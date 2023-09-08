// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/domain/repositories/repositories.dart';
import 'package:hakaton_uic/precentation/auth_pages/widgets/select_categories.dart';
import '../widgets/w_custom_button.dart';
import '/utils/formater.dart';
import '/precentation/widgets/w_text_field.dart';
import '/utils/colors.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});
  static const routeName = "/registration";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            "assets/svg/arrowLeft.svg",
            color: kBlack,
          ),
        ),
      ),
      body: const RegistrationBody(),
    );
  }
}

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({
    super.key,
  });

  @override
  State<RegistrationBody> createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController productNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int categoryId = 0;
  String categoryName = '';
  void _getCategoryId(int id, String name) {
    setState(() {
      categoryId = id;
      categoryName = name;
    });
  }

  bool isCategoryValid = false;
  void validCategory() {
    setState(() {
      isCategoryValid = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "signIn".tr(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "welcomeSub".tr(),
            style: TextStyle(
              fontSize: 12,
              color: kGreyTextColor,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          WTextField(
            title: "fio".tr(),
            hint: "enterFullName".tr(),
            controller: fullNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "productName".tr(),
            hint: "enterProductName".tr(),
            controller: productNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "category".tr(),
            style: TextStyle(
              color: kDarkGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => showCupertinoModalPopup(
              context: context,
              builder: (context) =>
                  SelectCategoriesModalPopup(getCategoryId: _getCategoryId),
            ),
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  border:
                      isCategoryValid ? Border.all(color: Colors.red) : null,
                  color: kFillColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(categoryName.isEmpty
                      ? "selectCategory".tr()
                      : categoryName),
                  SvgPicture.asset("assets/svg/chevron-down.svg")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "phoneNumber".tr(),
            hint: "(__) ___-__-__",
            controller: phoneNumberController,
            validator: (value) {
              if (value!.isEmpty) {
                return '';
              } else if (value
                      .split("(")
                      .join()
                      .split(")")
                      .join()
                      .split("-")
                      .join()
                      .split(" ")
                      .join()
                      .length <
                  9) {
                return "";
              }
              return null;
            },
            inputFormatters: [maskFormatter],
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text("+998"),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "email".tr(),
            controller: emailController,
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "address".tr(),
            hint: "enterAddress".tr(),
            validator: (value) {
              if (value!.isEmpty) {
                return '';
              }
              return null;
            },
            controller: addressController,
          ),
          const SizedBox(
            height: 44,
          ),
          WCustomButton(
            onPressed: () {
              if (categoryName.isEmpty) {
                validCategory();
              }
              if (_formKey.currentState!.validate() && categoryId != 0) {
                Repository().registration(
                    fullNameController.text,
                    productNameController.text,
                    categoryId,
                    phoneNumberController.text
                        .split("(")
                        .join()
                        .split(")")
                        .join()
                        .split("-")
                        .join()
                        .split(" ")
                        .join(),
                    addressController.text,
                    context);
              }
            },
            text: "signIn".tr(),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(),
              Text(
                "urSeller".tr(),
                style: TextStyle(
                  fontSize: 12,
                  color: kGreyTextColor,
                ),
              ),
              const Divider(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          WCustomButton(
            text: "logIn".tr(),
            onPressed: () {},
            hasBorder: true,
          )
        ],
      ),
    );
  }
}
