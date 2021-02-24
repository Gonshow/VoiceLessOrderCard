import 'package:flutter/material.dart';
//import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(Home());
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: MyApp()
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int selectedIndex = 4;
  List<String> titleList = ['支払い方法','レジ袋','あたため','その他'];

  List<IconData> iconList1 = [Icons.attach_money_sharp, Icons.credit_card_sharp, Icons.qr_code_sharp];
  List<IconData> iconList2 = [Icons.shopping_bag_sharp, Icons.no_encryption_sharp];
  List<IconData> iconList3 = [Icons.microwave_sharp, Icons.do_not_touch_outlined];
  List<String> nameList1 = ['現金','クレジット','QRコード'];
  List<String> nameList2 = ['必要', '不要'];
  List<String> nameList3 = ['必要','不要'];
  int secondaryIndex1 = 0;
  int secondaryIndex2 = 1;
  int secondaryIndex3 = 1;

  String valueText = '';
  bool nowInput = false;
  bool formIsNull = true;

  TextEditingController _mycontroller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
            title: Text('ようこそ'),
            content: Text(
                "コンビニやスーパーで\n商品と同時に提示してください",
                style: TextStyle(color:Colors.grey[800],fontSize: 24,fontWeight: FontWeight.bold, fontFamily: 'Mincho'),
            ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                  "OK",
                  style: TextStyle(color: Colors.deepOrange)
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    ));
    _mycontroller = new TextEditingController(text: valueText); // <- こんな感じ
  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return Stack(
        children: <Widget> [
          Container(
            width: size.width,
            height: size.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/wood-texture_00015.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            //resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
                elevation: 0.0,
                toolbarHeight: 0.09*size.height,
                backgroundColor: Colors.grey[800].withOpacity(0.8),
                title: Center(
                  child: Text(
                    'オーダーカード',
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mincho'),
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.3,
                  ),
                ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                    //padding: EdgeInsets.fromLTRB(0, 0.12*size.height, 0, 0.12*size.height),
                    alignment: Alignment.center,
                    height: 0.76*size.height,
                    width: 0.88*size.width,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0.02*size.width, 0, 0.02*size.width, 0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight,
                            colors: [
                              Color(0xffffffff),
                              Color(0xffcccccc),
                            ],
                            stops: const [
                              0.0,
                              1.0,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              titleList[0],
                              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mincho',),
                              textScaleFactor: 1.3,
                            ),
                            SizedBox(height: 0.02*size.width),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                customRadio1(iconList1[0], 0, nameList1[0], size),
                                Container(
                                    margin: EdgeInsets.fromLTRB(0.02*size.width, 0, 0.02*size.width, 0),
                                    child: customRadio1(iconList1[1], 1, nameList1[1], size)
                                ),
                                customRadio1(iconList1[2], 2, nameList1[2], size),
                              ],
                            ),
                            SizedBox(height: 0.02*size.width),
                            Divider(height: 0.04*size.width,thickness:2,color: Colors.black12,indent: 50,endIndent: 50,),
                            SizedBox(height: 0.01*size.width),

                            Text(
                              titleList[1],
                              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mincho'),
                              textScaleFactor: 1.3,
                            ),
                            SizedBox(height: 0.02*size.width),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                customRadio2(iconList2[0], 0, nameList2[0], size),
                                customRadio2(iconList2[1], 1, nameList2[1], size),
                              ],
                            ),
                            SizedBox(height: 0.02*size.width),
                            Divider(height: 0.04*size.width,thickness:2,color: Colors.black12,indent: 50,endIndent: 50,),
                            SizedBox(height: 0.01*size.width),
                            Text(
                              titleList[2],
                              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mincho'),
                              textScaleFactor: 1.3,
                            ),
                            //Divider(height: 20,thickness:2,color: Colors.black12,indent: 145,endIndent: 145,),
                            SizedBox(height: 0.02*size.width),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                customRadio3(iconList3[0], 0, nameList3[0], size),
                                customRadio3(iconList3[1], 1, nameList3[1], size),
                              ],
                            ),
                            SizedBox(height: 0.02*size.width),
                            Divider(height: 0.04*size.width,thickness:2,color: Colors.black12,indent: 50,endIndent: 50,),
                            SizedBox(height: 0.01*size.width),
                            Text(
                              titleList[3],
                              style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mincho'),
                              textScaleFactor: 1.3,
                            ),
                            SizedBox(height: 0.02*size.width),
                            Container(
                              //margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                              child: Column(
                                children: <Widget> [
                                  Visibility(
                                    child: Wrap(
                                        children: <Widget> [
                                          Visibility(
                                            child: InkWell(
                                              onTap: () {
                                                _changed(nowInput, valueText);
                                              },
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    valueText,
                                                    textAlign: TextAlign.center,
                                                    softWrap: true,
                                                    maxLines: 3,
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mincho', color: Colors.redAccent[400]),
                                                    textScaleFactor: 1.4,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            visible: !formIsNull,
                                            maintainState: !formIsNull,
                                          ),
                                          Visibility(
                                            child: IconButton(
                                              icon: Icon(Icons.edit,size: 0.03*size.height,color: Colors.grey,),
                                              onPressed: () {
                                                _changed(nowInput, valueText);
                                              },
                                            ),
                                            visible: formIsNull,
                                          ),
                                        ]
                                    ),
                                    visible: !nowInput,
                                    maintainState: !nowInput,
                                  ),
                                  Visibility(
                                    child: TextFormField(
                                      autofocus: true,
                                      maxLength: 48,
                                      maxLines: 2,
                                      decoration: InputDecoration(
                                        labelText: 'フリーワード(最大3行48文字まで表示できます)',
                                      ),
                                      controller: _mycontroller,
                                    ),
                                    visible: nowInput,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ),
            ),
            floatingActionButton: Visibility(
              child: FloatingActionButton(
                child: Icon(Icons.check),
                backgroundColor: Colors.deepOrangeAccent,
                onPressed: () {
                  _changed(nowInput, _mycontroller.text);
                },
              ),
              visible: nowInput,
            ),
          ),
        ]
    );
  }

  void changeIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  void changeSecondaryIndex1(int index){
    setState(() {
      secondaryIndex1 = index;
    });
  }
  void changeSecondaryIndex2(int index){
    setState(() {
      secondaryIndex2 = index;
    });
  }
  void changeSecondaryIndex3(int index){
    setState(() {
      secondaryIndex3 = index;
    });
  }

  Widget customRadio1(IconData icon,int index, String name, Size size){
    return OutlineButton(
      onPressed: () => changeSecondaryIndex1(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      borderSide: BorderSide(width: 4, color: secondaryIndex1 == index ? Colors.redAccent[400] : Colors.grey),
      child: Column(
          children: <Widget> [
            Icon(icon,color:  secondaryIndex1 == index ? Colors.redAccent[400] : Colors.grey,size: 0.07*size.height,),
            Container(
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, color: secondaryIndex1 == index ? Colors.redAccent[400] : Colors.grey),
                textScaleFactor: 1,
              ),
            ),
          ]
      ),
    );
  }
  Widget customRadio2(IconData icon,int index, String name, Size size){
    return OutlineButton(
      onPressed: () => changeSecondaryIndex2(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      borderSide: BorderSide(width: 3,color: secondaryIndex2 == index ? (index == 0 ? Colors.redAccent[400]: Colors.blue) : Colors.grey),
      child: Column(
          children: <Widget> [
            Icon(
              icon,
              color: secondaryIndex2 == index ? (index == 0 ? Colors.redAccent[400]: Colors.blue) : Colors.grey, size: 0.07*size.height,
            ),
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                  secondaryIndex2 == index
                      ? index == 0 ? Colors.red : Colors.blue
                      : Colors.grey
              ),
              textScaleFactor: 1,
            ),
          ]
      ),
    );
  }
  Widget customRadio3(IconData icon,int index, String name, Size size){
    return OutlineButton(
      onPressed: () => changeSecondaryIndex3(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      borderSide: BorderSide(width: 3,color: secondaryIndex3 == index ? (index == 0 ? Colors.redAccent[400]: Colors.blue) : Colors.grey),
      child: Column(
          children: <Widget> [
            Icon(
              icon,
              color: secondaryIndex3 == index ? (index == 0 ? Colors.redAccent[400]: Colors.blue) : Colors.grey, size: 0.07*size.height,
            ),
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                  secondaryIndex3 == index
                      ? index == 0 ? Colors.red : Colors.blue
                      : Colors.grey
              ),
              textScaleFactor: 1,
            ),
          ]
      ),
    );
  }
  void _changed(bool _nowInput, String field) {
    setState(() {
      nowInput = !_nowInput;
      valueText = field;
      valueText == '' ? formIsNull = true : formIsNull = false;
    });
  }

}