import 'package:flutter/material.dart';
import 'package:hakaton_uic/utils/colors.dart';

class ImageDetail extends StatefulWidget {
  const ImageDetail({
    super.key,
    required this.photos,
  });
  final List photos;
  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    final photos = widget.photos;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            "https://backendmaster.pythonanywhere.com${photos[currentImage]}",
            height: 266,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: photos.length <= 1 ? 0 : 12,
        ),
        photos.length <= 1
            ? const SizedBox()
            : SizedBox(
                height: 44,
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [
                        kWhite.withOpacity(.3),
                        kWhite,
                        kWhite,
                        kWhite.withOpacity(.3),
                      ],
                      stops: const [0.0, 0.1, 0.9, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final photo = photos[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentImage = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: currentImage == index
                                    ? kPrimaryColor
                                    : kElevatedButtonColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: currentImage == index
                                        ? kPrimaryColor
                                        : kElevatedButtonColor,
                                    width: currentImage == index ? 2 : 1)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "https://backendmaster.pythonanywhere.com$photo",
                                fit: BoxFit.cover,
                                width: 64,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: photos.length <= 1 ? 0 : photos.length),
                ),
              )
      ],
    );
  }
}
