import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screen/detail_page.dart';
import 'package:news_app/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  const CarouselWidget(this.articleList, {Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.articleList.map((article) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(article),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(article.urlToImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.1, 0.9],
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.white.withOpacity(0.1)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: titleArticleHeadline.copyWith(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        article.author,
                        style: authorDateArticleHeadline.copyWith(fontSize: 10),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageSlider,
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.9,
      ),
    );
  }
}
