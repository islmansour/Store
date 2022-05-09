import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:store/Data.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/models/Article.dart';

import '../ProductDetails.dart';
class Search extends StatefulWidget {
  final Function function;

  Search({Key key, this.function}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;

    return  Container(
      color: AppColors.third,
      child: SafeArea(
        //TODO: Apply your SearchBar
        child: SearchBar<Article>(
          hintText: 'Search',
          onSearch: _search,
          minimumChars: 1, 
            searchBarPadding:EdgeInsets.only(
            left: 20,
            right: 20
            ),
          onItemFound: (Article article, int index) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  //TODO: Set you own Data
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProductDetails(
                          article
                        ),
                      ));
                },
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 20, bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    //image:Exemples.discount[position].image,
                                    image: article.image[0],
                                    placeholder: '',
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 100,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: screenWidth-200,
                                            child: Text(
                                              article.title,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: Roboto.bold),
                                            ),
                                          ),

                                          Spacer()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 3,
                                            ),
                                            child: Text(
                                              article.label,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: Roboto.medium,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: <Widget>[
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 10,
                                            ),
                                            child: Text(
                                              article.price
                                                  .toString() +
                                                  '\$',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: Roboto.medium,
                                                  color: AppColors.first),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        Container(
                          color: Colors.grey.withOpacity(0.8),
                          height: 1,
                        )

                      ],
                    ),
                    Positioned(
                      top: 5,
                      right: 7,
                      child: new IconButton(
                        icon: Icon(
                          (article.favourite==1)? Icons.favorite :OMIcons.favoriteBorder,
                          color: (article.favourite==1)? Colors.red : Colors.grey,
                        ),
                        onPressed: () {

                          setState(() {
                            article.favourite=1-article.favourite;
                          });

                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}

Future<List<Article>> _search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  List<Article> list=[];
  for(int i=0; i<Data.articles.length;i++){
    if((Data.articles[i].title.toUpperCase().contains(search.toUpperCase()))
        || (Data.articles[i].description.toUpperCase().contains(search.toUpperCase()))){
      list.add(Data.articles[i]);
    }
  }

  return list;
}