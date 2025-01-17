import 'package:coacheers/coaching/camera/camerademo.dart';
import 'package:coacheers/coaching/coachingEndPage.dart';
import 'package:coacheers/frame/mainFrame.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class coachingSave extends StatefulWidget {
  final int id;
  final String name;
  final String profileURL;
  final String filePath;
  final String comment;

  const coachingSave(
      {Key? key,
      required this.id,
      required this.comment,
      required this.name,
      required this.profileURL,
      required this.filePath})
      : super(key: key);

  @override
  State<coachingSave> createState() => _coachingSaveState();
}

class _coachingSaveState extends State<coachingSave> {
  var _imagePath;
  final _tokenTextController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  double _progressValue = 0;

  Widget build(BuildContext context) {
    bool shouldPop = false;

    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Coacheers",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainFrame(
                            id: widget.id,
                            name: widget.name,
                            profileURL: widget.profileURL,
                            subindex: 2,
                          )),
                );
              },
            ),
          ],
          backgroundColor: Color(0xfffffffff),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 230, 0, 250),
              child: text("저장을 완료 하였습니다!"),
            ),
            BackHomeButton(),
          ],
        ),
        bottomNavigationBar: Container(
            color: Color(0xff1877F2),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: FloatingActionButton(
                          heroTag: "record",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainFrame(
                                        id: widget.id,
                                        name: widget.name,
                                        profileURL: widget.profileURL,
                                        subindex: 0,
                                      )),
                            );
                          },
                          child: Icon(
                            Icons.history,
                            size: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "기록",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                  child: FloatingActionButton.extended(
                    elevation: 4.0,
                    icon: const Icon(
                      Icons.wifi_tethering,
                    ),
                    heroTag: "coaching start",
                    label: Text("모의 면접 코칭 시작"),
                    onPressed: () {
                      CoachingButtonDialog(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: FloatingActionButton(
                          heroTag: "my",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainFrame(
                                        id: widget.id,
                                        name: widget.name,
                                        profileURL: widget.profileURL,
                                        subindex: 1,
                                      )),
                            );
                          },
                          child: Icon(
                            Icons.person,
                            size: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "마이",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget text(String comment) {
    return Center(
      child: Text(
        comment,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget BackHomeButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: FloatingActionButton.extended(
        backgroundColor: Color(0xff1ABC9C),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
        icon: const Icon(
          Icons.home,
        ),
        heroTag: "Save",
        label: Text("홈으로 이동"),
        onPressed: () {
          print(widget.filePath);
          print(widget.comment);
          print(widget.name);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainFrame(
                      id: widget.id,
                      name: widget.name,
                      profileURL: widget.profileURL,
                      subindex: 2,
                    )),
          );
          //CoachingButtonDialog(context);
        },
      ),
    );
  }

  CoachingButtonDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("코칭 영상 선택"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new TextButton(
                  child: new Text("앨범에서 영상 선택"),
                  onPressed: () async {
                    var source = ImageSource.gallery;
                    XFile? image = await _picker.pickVideo(source: source);
                    if (image != null) {
                      print(image.path);
                      setState(() {
                        try {
                          _imagePath = image.path;
                        } catch (e) {
                          print("Failed to get video: $e");
                        }
                      });
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CoachingEnd(
                              id: widget.id,
                              name: widget.name,
                              profileURL: widget.profileURL,
                              filePath: '/assets/videos/Test2.mp4')
                      ),
                    );
                  },
                ),
                new TextButton(
                  child: new Text("영상 녹화 시작"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CamerademoPage(
                                id: widget.id,
                                name: widget.name,
                                profileURL: widget.profileURL,
                              )),
                    );
                  },
                ),
              ],
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
