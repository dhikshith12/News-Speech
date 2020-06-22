import 'package:flutter/material.dart';
import 'main.dart';
import 'news.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'player_widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading;
  var newslist;

  void getNews() async{
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      newslist = news.news;
      loading = false;
    });
  }
  
  @override
  void initState(){
    loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: loading
                ? Center(
                  child: Text("Loading...")
                )
                : Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text('Top HeadLines',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 36.0,
                      )
                      )
                    ],
                    ),
                    Divider(),
                    Expanded(
                          child: ListView.builder(
                          itemBuilder: (context,index){
                            return ListTile(
                              leading: Image.network(newslist[index].urlToImage),
                              title: Text(newslist[index].title),
                              subtitle: Text(DateFormat.Hm().format(newslist[index].publishedAt)),
                              trailing: PlayerWidget(body: newslist[index].content,),
                            );
                          }
                          ),
                      ),
                  ],
                )
          ) 
        ),
    );
  }
}