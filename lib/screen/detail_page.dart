import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatefulWidget {
  final Article article;

  const DetailPage(this.article, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.article.urlToImage,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 330,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          widget.article.title,
                          style: titleArticle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.account_circle,
                                  size: 24,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.article.author,
                                  style:
                                      authorDateArticle.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 24,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  timeUntil(DateTime.parse(
                                      widget.article.publishedAt)),
                                  style:
                                      authorDateArticle.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.article.content,
                          style: detailArticle.copyWith(fontSize: 16),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 50,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 50,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.bookmark_outline),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String timeUntil(DateTime parse) {
    return timeago.format(parse, allowFromNow: true, locale: 'en');
  }
}
