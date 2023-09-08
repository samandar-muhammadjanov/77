import 'package:flutter/material.dart';
import 'package:hakaton_uic/domain/models/product_detail_model.dart';
import 'package:hakaton_uic/utils/colors.dart';

class AboutSeller extends StatelessWidget {
  const AboutSeller({
    super.key,
    required this.seller,
  });
  final Seller seller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: kWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Продавец",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: seller.profilePhoto == ""
                ? null
                : ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      "https://backendmaster.pythonanywhere.com${seller.profilePhoto}",
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
            title: Text(
              seller.fullName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "ID: ${seller.id}",
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ShowPhoneNumber(phoneNumber: seller.fullName,)
        ],
      ),
    );
  }
}

class ShowPhoneNumber extends StatelessWidget {
  const ShowPhoneNumber({
    super.key, required this.phoneNumber,
  });
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "+998 ** *** ** **",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              color: kFillColor, borderRadius: BorderRadius.circular(6)),
          child: const Text(
            "Показать телефон",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
