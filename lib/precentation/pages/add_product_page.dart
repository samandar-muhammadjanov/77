import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/precentation/auth_pages/widgets/select_categories.dart';
import 'package:hakaton_uic/precentation/widgets/w_elevated_button.dart';
import 'package:hakaton_uic/precentation/widgets/w_text_field.dart';
import 'package:hakaton_uic/utils/colors.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});
  static const routeName = "/addpost";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          "createProduct".tr(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/svg/arrowLeft.svg"),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: const [
          ContactInformation(),
          SizedBox(height: 16),
          ImoortantInformations(),
          SizedBox(height: 16),
          Price(),
          SizedBox(height: 16),
          Photo(),
          SizedBox(height: 16),
          Publish()
        ],
      ),
    );
  }
}

class Publish extends StatelessWidget {
  const Publish({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(color: kLightGrey),
                    borderRadius: BorderRadius.circular(6)),
              ),
              const SizedBox(
                width: 12,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontFamily: 'inter',
                      color: kBlack,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: "agreeWithTermsofuse1".tr(),
                    ),
                    TextSpan(
                        text: "agreeWithTermsofuse2".tr(),
                        style: TextStyle(color: kPrimaryColor)),
                    TextSpan(
                      text: "agreeWithTermsofuse3".tr(),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: kElevatedButtonColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "cancel".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: kBlack),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: WElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "publish".tr(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: kWhite),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "photo".tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "photoDescription".tr(),
            style: TextStyle(
              fontSize: 12,
              color: kGreyTextColor,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            color: kDarkGreyColor,
            child: Container(
              width: double.infinity,
              height: 132,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kFillColor),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svg/image.svg"),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "selectImage".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Цена",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "price".tr(),
            hint: "enterPrice".tr(),
            suffix: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffD6D6D6).withOpacity(0.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "UZS",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset("assets/svg/chevron-down.svg")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImoortantInformations extends StatelessWidget {
  const ImoortantInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "necessaryInfo".tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "productName".tr(),
            hint: "enterProductName".tr(),
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
            onTap: () => showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => const SelectCategoriesModalPopup(),
            ),
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kFillColor, borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("selectCategory".tr()),
                  SvgPicture.asset("assets/svg/chevron-down.svg")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "description".tr(),
            maxLines: 5,
            hint: "enterDesciption".tr(),
          )
        ],
      ),
    );
  }
}

class ContactInformation extends StatelessWidget {
  const ContactInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "contactInfo".tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(title: "fio".tr()),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "email".tr(),
            hint: "77shop@gmail.com",
          ),
          const SizedBox(
            height: 16,
          ),
          WTextField(
            title: "phoneNumber".tr(),
            hint: "(__) ___-__-__",
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("+998"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
