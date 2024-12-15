import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// 建立一個音樂播放器並設定為循環播放模式
final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

// 主應用程式入口，使用 StatelessWidget 建構 MaterialApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath example', // 應用程式標題
      debugShowCheckedModeBanner: false, // 隱藏 debug 標誌
      theme: ThemeData(primarySwatch: Colors.green), // 設定主要主題顏色
      home: HomePage(), // 主頁面設定為 HomePage
    );
  }
}

// HomePage 是一個 StatefulWidget，主要負責底部導航功能與畫面切換
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 頁面對應的 Widget 列表
  final tabs = [
    Screen1(), // 自我介紹頁面
    Screen2(), // 學習歷程頁面
    Screen3(), // 學習計畫頁面
    Screen4(), // 專業方向頁面
  ];

  int previousIndex = 0; // 記錄先前選擇的頁面索引
  int currentIndex = 0; // 當前選擇的頁面索引

  @override
  Widget build(BuildContext context) {
    // 當當前頁面是第 0 頁時，自動播放第一首音樂
    player.setPlaybackRate(1.0);
    if (currentIndex == 0) player.play(AssetSource("1.mp3"));

    return Scaffold(
      appBar: AppBar(
        title: Text('我的自傳'), // 應用標題
        centerTitle: true, // 標題置中
      ),
      body: tabs[currentIndex], // 根據 currentIndex 顯示對應的頁面
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 固定底部導航按鈕
        backgroundColor: Colors.blue, // 背景顏色
        selectedItemColor: Colors.white, // 被選中的文字顏色
        selectedFontSize: 18, // 被選中的文字大小
        unselectedFontSize: 14, // 未被選中的文字大小
        iconSize: 30, // 圖標大小
        currentIndex: currentIndex, // 當前選中的按鈕索引
        items: [
          BottomNavigationBarItem(
            // 自我介紹頁面
            icon: currentIndex == 0
                ? Image.asset('assets/f1.jpg', width: 40, height: 40)
                : Image.asset('assets/f1.jpg', width: 30, height: 30),
            label: '自我介紹',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程'),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫'),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向'),
        ],
        onTap: (index) {
          // 切換頁面並切換背景音樂
          setState(() {
            previousIndex = currentIndex;
            currentIndex = index;
            if (index == 0) {
              if (previousIndex == currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("1.mp3"));
            }
            if (index == 1) {
              if (previousIndex == currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("2.mp3"));
            }
            if (index == 2) {
              if (previousIndex == currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("3.mp3"));
            }
            if (index == 3) {
              if (previousIndex == currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("4.mp3"));
            }
          });
        },
      ),
    );
  }
}

// Screen1: 自我介紹頁面，使用 Text 和圖片組合
class Screen1 extends StatelessWidget {
  Screen1({super.key});

  // 自傳文字內容
  String title='基本介紹';
  final String s1 = '\t我是四資工三甲翁志誠，出生於一個小康家庭，家裡是三代同堂的情況，爸爸是機車行的老闆，媽媽則是自己經營一間髮廊，家裡的阿公阿嬤已經退休，目前因為新家太小所以搬到了外面，我有個姊姊，年紀大我兩歲，已經畢業並且找了份科技公司小編的工作。'
  '\n\t國小當過衛生股長，也因此從國小到大學都當著衛生股長，在國中因為喜歡上了積木程式於是決定考上了鶯歌工商的資訊科'
  '\n\t在高職時期參加多項比賽，包括全國工科技藝競賽、新北市專題競賽、新北市作文比賽，並且以此為契機，以技優錄取的方式進入了高雄科技大學的資訊工程系'
  '\n\t在大學時期認真向上，學習php網頁、C語言、Python等語言，目前正在以底層系統設計和嵌入式系統為目標，希望能夠在將來可以用推甄的方式上去北科大的資訊工程系碩士';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who an I',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/翁志誠.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('assets/Nvidia.JPG'), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.purple, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('assets/2024春節圖片.jpg'), fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          // 使用 Flexible 將 ListView 填滿剩餘空間，並且控制成可控高度
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30,20, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30,20, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(
              s1,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

// Screen2: 學習歷程頁面
class Screen2 extends StatelessWidget {

  List<String> title=['一切的開頭','夢開始的地方','打磨玉石的過程','全新的開始，摔倒了起身繼續走','開闊式未來是大學的必修課','邁向未來的一步'];
  final List<String> s1 = [
    '小時候，由於家裡沒什麼人陪伴，因此平時都是玩電腦遊戲為主，也就因為這個原因，使我對遊戲產生一定的好奇，然而到了國中階段，那是我與App Inventor的第一次相遇，看著這些充滿邏輯的積木方塊使我著迷，當其他同學已經完成了作品，玩著遊戲時，我總是盡可能地嘗試將課堂的內容，做的更好，就是為了做出高品質的遊戲，並且經常將成品展示給老師以及周遭同學看。這些年，老師看見如此積極的我，便向我介紹了程式語言，於是也就成了我走向”程式設計”的開端。',
    '在高中階段，經過了國中電腦老師的介紹，我選擇了資訊科，我開始在老師的帶領下嘗試去接觸程式，從C語言、Python、VistualBasic、C#，我都嘗試去學習，在這些事情的過程中，我做了人生重大的決定，就是去參加全國工科技藝競賽，那是個熱血的奮鬥史，也讓我學到了非常多的事情，我學會了各種的演算法，並且繼承了學長的意志，最終在比賽中獲取佳績。',
    '在高中三年，我也參加了各種的活動，我考取了電腦硬體裝修的證照，參加了全國自走車比賽，被老師推薦去參加校外的自走車營隊，學會了雲端技術和AI，也參加了志工活動去教導國中生自走車，甚至還參加了新北市專題競賽，那時候的我生活過得非常且充實，也希望這份心力繼續延續到大學。',
    '到了大學，在人生地不熟的情況下，我踏入高科大的校門，那是人生的新篇章，也是遍地荊棘的道路，第一次在校外一個人生活，第一次讀原文書，第一次大包小包的背上行囊返鄉，數不清的第一次衝進了我幼小的心靈，也讓我開始感到了迷惘未來，大一，我開始嘗試著學習新的事物，與別人交流，去當志工淨灘，也去參加了每個禮拜的桌遊日，還去嘗試了拳擊，在保持學分分數平均85的情況下，逐漸步上正軌。',
    '大二的我依然努力接觸其他事物，自己去聽了場Jazz表演，玩了實體卡牌遊戲，也去看了各種個科技展覽，希望能從這些方向找到未來的去向，我的學業依然穩定發揮，保持著很好的分數，也被同學邀請參加比賽，參與了全國黑克松，並且屢獲佳績，在二下嘗試練習英文口說，經歷了面試和行前課程，在暑假參加了國際統整工程營隊，去了日本熊本大學跟日本和韓國同學交流，與隊友設計出一台可APP移動和操控高度的自動輪椅，在營隊中獲取了最高的獎項。',
    '大三成功的選入了某位老師的專題生，並且開始學習雲端、GIT、AI、系統相關的內容，並且現在依然努力精進著，我的生活看似精彩，實則充滿各種困境和災難，但我還是跨出了每一步，無論眼前是否為無止境的煉獄，還是沒有道路的懸崖，還不知道未來該邁向何方的我，每天依舊在大學的生活中匍匐前進。'
  ];
  List<String> Picture = ['國中','高職專題','工科技藝競賽','Table','ICDC','黑克松'];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,  // 限制高度
              child: ListView.builder(
                itemCount: title.length, // 根據 title 長度動態產生
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent,
                              offset: Offset(6, 6),
                            ),
                          ],
                        ),
                        child: Text(
                          title[index], // 取得 titles 中的文字
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amberAccent,
                              offset: Offset(6, 6),
                            ),
                          ],
                        ),
                        child: Text(
                          s1[index], // 取得 s1s 中的文字
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.purple, width: 2, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage('assets/${Picture[index]}.jpg'), fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 10,             // 設定線條的高度
                        color: Colors.deepPurple,   // 設定顏色
                        margin: EdgeInsets.fromLTRB(30, 20, 30, 20),  // 設定左右邊距
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}

// Screen3: 學習計畫頁面，展示計畫的列表
class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("學習計劃"),
      ),
      body: ListView(
        children: <Widget>[
          // 大一
          ExpansionTile(
            title: Text(
              '大一',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(title: Text('練習英文多益')),
              ListTile(title: Text('學習演算法')),
              ListTile(title: Text('撰寫網站程式')),
            ],
          ),
          Divider(),

          // 大二
          ExpansionTile(
            title: Text(
              '大二',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(title: Text('學習物件導向程式')),
              ListTile(title: Text('掌握一門新的程式語言')),
              ListTile(title: Text('嘗試考取多益550')),
              ListTile(title: Text('參與ICDC(國際統整工程營隊)')),
            ],
          ),
          Divider(),

          // 大三
          ExpansionTile(
            title: Text(
              '大三',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(title: Text('學習軟體工程')),
              ListTile(title: Text('實作嵌入式系統')),
              ListTile(title: Text('嘗試用AI學習運用撰寫程式')),
            ],
          ),
          Divider(),

          // 大四
          ExpansionTile(
            title: Text(
              '大四',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(title: Text('參加大公司實習')),
              ListTile(title: Text('推甄北科大碩士')),
              ListTile(title: Text('設計一個APP')),
            ],
          ),
        ],
      ),
    );
  }
}

// Screen4: 專業方向頁面
class Screen4 extends StatelessWidget {

  final List<Map<String, String>> skills = [
    {'image': 'assets/image/flutter.jpg', 'name': 'Flutter'},
    {'image': 'assets/image/Android_Studio.jpg', 'name': 'Android Studio'},
    {'image': 'assets/image/python.jpg', 'name': 'Python'},
    {'image': 'assets/image/C++.jpg', 'name': 'C++'},
    {'image': 'assets/image/C.jpg', 'name': 'C語言'},
    {'image': 'assets/image/JavaLogo.jpg', 'name': 'Java'},
    {'image': 'assets/image/PHP.jpg', 'name': 'PHP'},
    {'image': 'assets/image/C_Sharp.jpg', 'name': 'C#'},
    {'image': 'assets/image/SQLserver.jpg', 'name': 'SQL'},
    {'image': 'assets/image/Unity.jpg', 'name': 'Unity'},
    {'image': 'assets/image/Arduino.jpg', 'name': 'Arduino'},
    {'image': 'assets/image/CodeIgniter.jpg', 'name': 'CodeIgniter'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("專業方向發展"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 一行兩個圖片
                crossAxisSpacing: 10, // 橫向間距
                mainAxisSpacing: 10, // 縱向間距
                childAspectRatio: 1, // 圖片比例 (正方形)
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(2, 2),
                            )
                          ],
                          image: DecorationImage(
                            image: AssetImage(skills[index]['image']!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      skills[index]['name']!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

