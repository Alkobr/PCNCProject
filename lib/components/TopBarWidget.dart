import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBarWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  TopBarWidget({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  "https://s3-alpha-sig.figma.com/img/74e6/66f1/f9c9e798116bf7f61007af5f99709080?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HTWW2pFQBdAHeHWa~jLzBoQfAMci05TtSQUqJ1o~1dL4A9JlPukZzUoGn8JSZziqxzzCJV40dCTG3k5WvyNrVqCi5V83S3RAfX~8mnl4ZDiKyNtZIUao2eWh42BZY6Udor8-DzJ88qmzGp~ZDrLbN7qwCs50n4EV2Hqr6ZJuZZrVwh8e1QGM8BhGfSVS-xnXZLYS8WX9uIG-KZtCq67yxfqPSCyDDvyvyFA6X7anJ7qAqiRu7Y8GgOJYeFOJBFIHf1jEoHt2H31gZ6NYJwkbWZ1YA7CspBmntzP7n09FQJ63UDv5RjvH7qLgjpVajG4FmvvuV6oKCBtrxKl1bjn9dA__",
                  width: 35,
                  height: 40,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 10),
            const Text(
              "PCNC",
              style: TextStyle(
                color: Color(0xfff2673b),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            )
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: Image.network(
            "https://s3-alpha-sig.figma.com/img/e2db/1865/e7299c33d1d7de36aa46e37cda72d981?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=IqYKulpdC7Saaf477CFEQu24l-1vgJs3fMhyZbeOnnG9m~rYlKOArum~~FWtKisf3FsyH8OG6tUEXP5-Tw2V3AXfs~BVAsxgVJqoPgdDvQxwyAfcOzrfMmXtSN8Y3jjRj7STucPlg-ptOw4cg-za~DTRLK81JN8SIjmsBdQMYWh6SFI15gTL5L1FsdYiHaYjX60HpOMQ3wvzJPnZ1ENtxwf0LG7eWiUDIq7s9Cs1jIpecQLbpf88p2wTQJIM1rqKa9ZVX-FZLQNYBDEK88L43IQatM9-InyRvjewWdLr6RsvB3h9LzWLrrea3UnW4KfAsFzxU1K7CyamFchyPGUnEg__",
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
