import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/catalog.dart';
import 'package:my_flutter_app/utils/routes.dart';
import 'package:my_flutter_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.mH8,
            children: [
              "\$${catalog.price}".text.bold.xl2.red500.make(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluish,
                    ),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    )),
                child: "Buy".text.make(),
              ).wh(80,30)
            ],
          ).p20(),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image)).h32(context)
                  .p16(),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(children: [
                    catalog.name.text.xl4.color(MyTheme.darkBluish).bold.make(),
                    catalog.desc.text.caption(context).make(),
                    10.heightBox,
                    "this ti fdgifdfer egj ejnrif efefbrueif rjefbefjsnf jfefnekjff jejefejf efjebfef efejfe fjef ewh ajfb hhfjffkf hffhfjf eh ehf ehehkef nininf eub u  eujs,jfj ,,uebfbf jbfjfasnbkjfbibj  ufjdfjdfdfdfdf fdfjf dfjbfueifn"
                        .text.caption(context).make().p16()
                  ]).py64(),
                ),
              ))
            ],
          ),
        ));
  }
}
