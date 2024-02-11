import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../configs/x_configs.dart';
import '../models/x_models.dart';

class BannerSlider extends StatefulWidget {
  // final List<String> items;
  final List<Warung> warungs;
  const BannerSlider({super.key, required this.warungs});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.warungs
              .map(
                // (e) => Image.asset(
                //   e.logo!,
                //   height: 206.0,
                //   width: MediaQuery.of(context).size.width,
                //   fit: BoxFit.fill,
                // ),
                (e) => Image.network(
                  e.logo!.contains('http')
                      ? e.logo!
                      : BASE_URL_IMAGE + 'warung/' + e.logo!,
                  height: 206,
                  fit: BoxFit.fill,
                ),
              )
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 315 / 152,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _current = index;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.warungs.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 20.0 : 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? kAppGrey
                            : kAppPrimary)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
