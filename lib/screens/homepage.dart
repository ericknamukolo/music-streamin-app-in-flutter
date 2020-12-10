import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/screens/chill_page.dart';
import 'package:musicapp/screens/rap_page.dart';
import 'package:musicapp/screens/trap_page.dart';
import 'package:musicapp/screens/bass_page.dart';
import 'package:musicapp/screens/house_page.dart';
import 'package:musicapp/screens/latin_page.dart';
import 'package:musicapp/screens/indie_page.dart';
import 'package:musicapp/screens/r&b_page.dart';
import 'package:musicapp/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
//imports for the random page services
import 'package:musicapp/utils/random_page_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:musicapp/models/channel_info.dart';
import 'package:musicapp/models/viideos_list.dart';
import 'package:musicapp/screens/video_player_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: SafeArea(
            child: Container(
              width: 200,
              child: Drawer(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      maxRadius: 80,
                      backgroundColor: Color(0xFFFF6D00),
                      child: Image.asset(
                        'images/logo.png',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      elevation: 20,
                      onPressed: () {
                        openUrl();
                      },
                      color: Color(0xFFFF6D00),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('images/button.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6D00),
            title: Text(
              'Void Player',
              style: kButtonTextStyle,
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Categories',
                    style: kButtonTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  icon: Icon(FontAwesomeIcons.fileVideo),
                ),
                Tab(
                  child: Text(
                    'Random Music',
                    style: kButtonTextStyle.copyWith(fontSize: 20),
                  ),
                  icon: Icon(FontAwesomeIcons.random),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CategoriesContent(),
              RandomPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Choose a category below', style: kButtonTextStyle),
          ),

          //first row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CategoryCard(
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RapPage()));
                    },
                    pic: AssetImage('images/rap.jpg'),
                    text: 'Rap',
                  ),
                ),
                Expanded(
                  child: CategoryCard(
                    pic: AssetImage('images/chill.jpg'),
                    text: 'Chill',
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChillPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
          //second row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CategoryCard(
                    pic: AssetImage('images/trap.jpg'),
                    text: 'Trap',
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TrapPage()));
                    },
                  ),
                ),
                Expanded(
                  child: CategoryCard(
                    pic: AssetImage('images/bass.jpg'),
                    text: 'Bass',
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BassPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
          //third row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CategoryCard(
                    pic: AssetImage('images/house.jpg'),
                    text: 'House',
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HousePage()));
                    },
                  ),
                ),
                Expanded(
                  child: CategoryCard(
                    pic: AssetImage('images/latin.jpg'),
                    text: 'Latin',
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LatinPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
          //fourth row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CategoryCard(
                    pic: AssetImage('images/indie.jpg'),
                    text: 'Indie',
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => IndiePage()));
                    },
                  ),
                ),
                Expanded(
                  child: CategoryCard(
                    pic: AssetImage('images/r&b.jpg'),
                    text: 'R&B',
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RandBPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

openUrl() {
  launch('https://www.buymeacoffee.com/erickmndev');
}

class CategoryCard extends StatelessWidget {
  CategoryCard({this.text, this.pic, this.click});
  final String text;
  final AssetImage pic;
  final Function click;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: pic,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Text(
              text,
              style: kButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}

class RandomPage extends StatefulWidget {
  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  //
  ChannelInfo _channelInfo;
  VideosList _videosList;
  Item _item;
  bool _loading;
  String _playListId;
  String _nextPageToken;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList();
    _videosList.videos = List();
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items[0];
    _playListId = _item.contentDetails.relatedPlaylists.uploads;
    print('_playListId $_playListId');
    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  _loadVideos() async {
    VideosList tempVideosList = await Services.getVideosList(
      playListId: _playListId,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempVideosList.nextPageToken;
    _videosList.videos.addAll(tempVideosList.videos);
    print('videos: ${_videosList.videos.length}');
    print('_nextPageToken $_nextPageToken');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Wide variety of music', style: kButtonTextStyle),
          ),
          _buildInfoView(),
          Expanded(
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (ScrollNotification notification) {
                if (_videosList.videos.length >=
                    int.parse(_item.statistics.videoCount)) {
                  return true;
                }
                if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
                  _loadVideos();
                }
                return true;
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _videosList.videos.length,
                itemBuilder: (context, index) {
                  VideoItem videoItem = _videosList.videos[index];
                  return InkWell(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return VideoPlayerScreen(
                          videoItem: videoItem,
                        );
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: videoItem
                                .video.thumbnails.thumbnailsDefault.url,
                          ),
                          SizedBox(width: 20),
                          Flexible(child: Text(videoItem.video.title)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildInfoView() {
    return _loading
        ? CircularProgressIndicator()
        : Container(
            // padding: EdgeInsets.all(20.0),
            // child: Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Row(
            //       children: [
            //         CircleAvatar(
            //           backgroundImage: CachedNetworkImageProvider(
            //             _item.snippet.thumbnails.medium.url,
            //           ),
            //         ),
            //         SizedBox(width: 20),
            //         Expanded(
            //           child: Text(
            //             _item.snippet.title,
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.w400,
            //             ),
            //           ),
            //         ),
            //         Text(_item.statistics.videoCount),
            //         SizedBox(width: 20),
            //       ],
            //     ),
            //   ),
            // ),
            );
  }
}
