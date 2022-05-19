import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screen/detail_page.dart';
import 'package:news_app/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return widget that clickable
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(article)));
      },
      child: Card(
          elevation: 5,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: edgeDetail),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    //child: Image.network(
                    //  article.urlToImage,
                    //  height: 80,
                    //  fit: BoxFit.cover,
                    //  width: 150,
                    //),
                    child: FadeInImage.memoryNetwork(
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://btklsby.go.id/images/placeholder/basic.png',
                          height: 80,
                          fit: BoxFit.cover,
                          width: 150,
                        );
                      },
                      placeholder: kTransparentImage,
                      image: article.urlToImage,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 80,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: titleArticle.copyWith(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              timeUntil(DateTime.parse(article.publishedAt)),
                              overflow: TextOverflow.ellipsis,
                              style: authorDateArticle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              article.author,
                              overflow: TextOverflow.ellipsis,
                              style: authorDateArticle.copyWith(fontSize: 12),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

String timeUntil(DateTime parse) {
  return timeago.format(parse, allowFromNow: true, locale: 'en');
}
