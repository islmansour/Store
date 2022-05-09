import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/main.dart';
import 'package:store/models/Article.dart';
import 'package:store/ui/productDetailsWidget/ImageDialog.dart';
import 'package:url_launcher/url_launcher.dart';


// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  Article article;

  ProductDetails(this.article);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(article);
}

class _ProductDetailsState extends State<ProductDetails> {
  Article article;

  _ProductDetailsState(
      this.article);

  int n = 1;
  int colorClick = 0;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.first,
        title: Text(
          article.label,
          style: TextStyle(
            color: Colors.black,
              fontFamily: Roboto.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
      ),
      body: Builder(
        builder: (context){

          return ListView(
            children: <Widget>[
              Container(
                height: width*0.8 +20,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,position){

                    return InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ImageDialog(image: article.image[position]);
                          },

                        );
                      },
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      child: Container(

                        width: double.parse(MediaQuery.of(context).size.width.toString())*0.8,
                        height: double.parse(MediaQuery.of(context).size.width.toString())*0.8,
                        decoration: BoxStyle.withShadow,

                        margin: EdgeInsets.only(top: 10, right: 10, left: 10,
                            bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: FadeInImage.assetNetwork(
                            image: article.image[position],
                            placeholder: "",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: article.image.length,),


              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    IconButton(
                      onPressed: () async {
                        //TODO: set your own URL
                        var url = article.link;
                        if (await canLaunch(url)) {
                          launch(url);
                        }
                      },
                      icon: Icon(
                        OMIcons.openInBrowser,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        (article.favourite==1) ? OMIcons.favorite : OMIcons.favoriteBorder,
                        color: (article.favourite==1) ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          article.favourite=1-article.favourite;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: Text(
                        article.title,
                        style: TextStyle( fontSize: 16,
                            fontFamily: Roboto.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:10),
                      child: Text(
                        article.description,
                        style: TextStyle(fontSize: 13,
                            fontFamily: Roboto.regular),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top:20),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Size',
                                  style: TextStyle(
                                    fontFamily: Roboto.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                article.size,
                                style: TextStyle(fontSize: 13,
                                    fontFamily: Roboto.regular),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontFamily: Roboto.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1.0,
                                          // has the effect of softening the shadow
                                          spreadRadius: 1.0,
                                          // has the effect of extending the shadow
                                          offset: Offset(
                                            0, // horizontal, move right 10
                                            1, // vertical, move down 10
                                          ),
                                        )
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          n++;
                                        });
                                      },
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Text(
                                      n.toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Roboto.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 1.0,
                                          // has the effect of softening the shadow
                                          spreadRadius: 1.0,
                                          // has the effect of extending the shadow
                                          offset: Offset(
                                            0, // horizontal, move right 10
                                            1, // vertical, move down 10
                                          ),
                                        )
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (n != 1) {
                                            n--;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top:20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Color',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(

                                    fontFamily: Roboto.bold,
                                    fontSize: 16,
                                  ),
                                ),

                                ///TODO
                                Container(
                                  height: 50,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, position) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            colorClick = position;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right: 10,
                                          ),
                                          width: (colorClick == position) ? 20 : 15,
                                          height: (colorClick == position) ? 20 : 15,
                                          decoration: new BoxDecoration(
                                            color: article.colors[position],
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 1.0,
                                                // has the effect of softening the shadow
                                                spreadRadius: 1.0,
                                                // has the effect of extending the shadow
                                                offset: Offset(
                                                  0, // horizontal, move right 10
                                                  1, // vertical, move down 10
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: article.colors.length,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: new Text(
                              (n * article.price).toStringAsFixed(2) + '\$',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: Roboto.bold,
                                  color: AppColors.second),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      margin:
                      EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 50),
                      child: FlatButton(
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: ((article.quatity==0)||(!cartArticles.contains(article)))? Text("Added to cart",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: Roboto.regular
                            ),
                            ): Text("Already added",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: Roboto.regular
                              ),),
                            backgroundColor: AppColors.first,
                          ));
                          if((article.quatity==0)||(!cartArticles.contains(article))){
                            article.quatity=0;
                            article.quatity+=n;
                            setState(() {
                              cartArticles.add(article);
                            });

                          }

                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: new Text(
                            'ADD TO MY CART',
                            style: new TextStyle(

                                fontFamily: Roboto.bold),
                          ),
                        ),
                        color: AppColors.first,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
