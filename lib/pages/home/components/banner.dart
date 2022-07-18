import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodcourtapp/services/firebase_services.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  FirebaseServices _service = FirebaseServices();
  double scrollPosition = 0;
  List _bannerImage = [];

  @override
  void initState(){
    getBanners();
    super.initState();
  }

  getBanners(){
    return _service.homeBanner
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //documents banners
        setState(() {
          _bannerImage.add(doc['image']);
        });
      });
    });
  }



  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade200,
                  child: PageView.builder(
                      itemCount: _bannerImage.length,
                      itemBuilder: (BuildContext context, int index){
                        return CachedNetworkImage(
                            imageUrl: _bannerImage[index],
                            fit: BoxFit.fill,
                            placeholder: (context, url) => GFShimmer(
                            showShimmerEffect: true,
                            mainColor: Colors.grey.shade600,
                            secondaryColor: Colors.grey.shade400,
                            child: Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue.shade200,
                            )
                        )
                        );
                      },
                    onPageChanged: (val){
                      setState(() {
                      scrollPosition = val.toDouble();
                    });
                  },
                ),
              ),
            ),
          ),
        DotsIndicatorWidget(scrollPosition: scrollPosition),
        ]
        );
  }
}

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    Key? key,
    required this.scrollPosition,
  }) : super(key: key);

  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.0,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DotsIndicator(
              position: scrollPosition,
              dotsCount: 3,
              decorator: DotsDecorator(
                color: Colors.white,
                spacing: const EdgeInsets.all(2),
                size: const Size.square(6),
                activeSize: const Size(12,6),
                activeShape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(4),
              )
            ),),
          ),
        ],
      ),
    );
  }
}
