import 'package:dio/dio.dart';
import 'package:hansungunivdorm/models/shared_pref_model.dart';
import 'package:hansungunivdorm/models/sleepout_model.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

import '../models/notice_model.dart';
import '../models/score_model.dart';

final dio = Dio();

String removeWhiteSpace(str) {
  return str.trim().replaceAll('\n', '').replaceAll('\t', '');
}

Future<Map<String, dynamic>> loginDorm(id, pw) async {
  final response = await dio.request(
    'https://dorm.hansung.ac.kr/loginProc.do',
    data: {
      'id': id,
      'pass': pw,
    },
    options: Options(
        method: 'POST', contentType: 'application/x-www-form-urlencoded'),
  );

  if (!response.data.toString().contains('location.href')) {
    return {
      'return': false,
      'name': '',
      'jsessionid': '',
    };
  }

  SharedPrefModel.setAccount(id, pw);

  return {
    'return': true,
    'name': response.data.toString().split("alert('")[1].split(' ')[0],
    'jsessionid':
        'JSESSIONID${response.headers['set-cookie'].toString().split('JSESSIONID')[1].split(";")[0]};',
  };
}

Future<void> logoutDorm() async {
  await dio.request(
    'https://dorm.hansung.ac.kr/logOut.do',
    options: Options(
      method: 'GET',
    ),
  );
}

Future<List<NoticeModel>> getFixedNotice() async {
  List<NoticeModel> dataList = [];
  final response = await dio.request(
    'https://dorm.hansung.ac.kr/kor/student/noti.do',
    data: {
      'pageIndex': 1,
      'sw': '',
    },
    options: Options(
      method: 'POST',
      contentType: 'application/x-www-form-urlencoded',
    ),
  );

  Document document = parser.parse(response.toString());

  List<Element> tr =
      document.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

  tr.forEach((element) {
    bool fixed =
        element.getElementsByTagName('td')[0].innerHtml.contains('img');
    String title = removeWhiteSpace(element.getElementsByTagName('td')[1].text);
    bool attachment =
        element.getElementsByTagName('td')[2].innerHtml.contains('img');
    String name = removeWhiteSpace(element.getElementsByTagName('td')[3].text);
    String date = removeWhiteSpace(element.getElementsByTagName('td')[4].text);
    String count = removeWhiteSpace(element.getElementsByTagName('td')[5].text);
    String idx = element
        .getElementsByTagName('td')[1]
        .innerHtml
        .split("moveView('")[1]
        .split("');")[0];

    if (fixed) {
      dataList.add(NoticeModel(
        fixed: fixed,
        title: title,
        attachment: attachment,
        name: name,
        date: date,
        count: count,
        idx: idx,
      ));
    }
  });

  return dataList;
}

Future<List<NoticeModel>> getNotice(
    {String? sw, required int pageIndex}) async {
  List<NoticeModel> dataList = [];
  final response = await dio.request(
    'https://dorm.hansung.ac.kr/kor/student/noti.do',
    data: {
      'pageIndex': pageIndex,
      'sw': sw ?? '',
    },
    options: Options(
        method: 'POST', contentType: 'application/x-www-form-urlencoded'),
  );

  Document document = parser.parse(response.toString());

  List<Element> tr =
      document.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

  tr.forEach((element) {
    bool fixed =
        element.getElementsByTagName('td')[0].innerHtml.contains('img');
    String title = removeWhiteSpace(element.getElementsByTagName('td')[1].text);
    bool attachment =
        element.getElementsByTagName('td')[2].innerHtml.contains('img');
    String name = removeWhiteSpace(element.getElementsByTagName('td')[3].text);
    String date = removeWhiteSpace(element.getElementsByTagName('td')[4].text);
    String count = removeWhiteSpace(element.getElementsByTagName('td')[5].text);
    String idx = element
        .getElementsByTagName('td')[1]
        .innerHtml
        .split("moveView('")[1]
        .split("');")[0];
    if (!fixed) {
      dataList.add(NoticeModel(
        fixed: fixed,
        title: title,
        attachment: attachment,
        name: name,
        date: date,
        count: count,
        idx: idx,
      ));
    }
  });

  return dataList;
}

Future<List<dynamic>> getFaqList() async {
  List<dynamic> dataList = [];
  final response = await dio.request(
    'https://dorm.hansung.ac.kr/kor/student/sfaq.do',
    options: Options(
      method: 'GET',
    ),
  );

  Document document = parser.parse(response.toString());

  List<Element> li = document
      .getElementsByClassName('acd_list_wrap')[0]
      .getElementsByTagName('li');

  li.forEach((element) {
    String title = removeWhiteSpace(element.getElementsByTagName('a')[0].text);
    String content =
        removeWhiteSpace(element.getElementsByClassName('cont')[0].text);
    dataList.add({
      'title': title,
      'content': content,
    });
  });

  return dataList;
}

Future<List<ScoreModel>> getScoreList(String jsessionid, int page) async {
  List<ScoreModel> dataList = [];
  try {
    final response = await dio.request(
      'https://dorm.hansung.ac.kr/kor/member/scor.do',
      data: {
        'pageIndex': page,
      },
      options: Options(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        headers: {'Cookie': jsessionid},
      ),
    );

    Document document = parser.parse(response.toString());
    Element contents = document.getElementsByClassName('scontents')[0];

    String totalPlus = contents
        .getElementsByClassName('search')[0]
        .getElementsByTagName('strong')[0]
        .text;
    String totalMinus = contents
        .getElementsByClassName('search')[0]
        .getElementsByTagName('strong')[1]
        .text;
    String totalScore = contents
        .getElementsByClassName('search')[0]
        .getElementsByTagName('strong')[2]
        .text;

    List<Element> tr = contents
        .getElementsByTagName('table')[0]
        .getElementsByTagName('tbody')[0]
        .getElementsByTagName('tr');

    tr.forEach((element) {
      String number = element.getElementsByTagName('td')[0].text;
      String name = element.getElementsByTagName('td')[1].text;
      String reason = element.getElementsByTagName('td')[2].text;
      String score = element.getElementsByTagName('td')[3].text;
      String date = element.getElementsByTagName('td')[4].text;
      dataList.add(ScoreModel(
        totalPlus: totalPlus,
        totalMinus: totalMinus,
        totalScore: totalScore,
        number: number,
        name: name,
        reason: reason,
        score: score,
        date: date,
      ));
    });

    return dataList;
  } catch (_) {
    return [];
  }
}

Future<List<SleepOutModel>> getSleepOutsList(
    String jsessionid, int page) async {
  List<SleepOutModel> dataList = [];
  try {
    final response = await dio.request(
      'https://dorm.hansung.ac.kr/kor/member/slpr.do',
      data: {
        'pageIndex': page,
      },
      options: Options(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        headers: {'Cookie': jsessionid},
      ),
    );

    Document document = parser.parse(response.toString());
    Element contents = document.getElementsByClassName('scontents')[0];

    List<Element> tr = contents
        .getElementsByTagName('table')[0]
        .getElementsByTagName('tbody')[0]
        .getElementsByTagName('tr');

    tr.forEach((element) {
      String number = element.getElementsByTagName('td')[0].text;
      String name = element.getElementsByTagName('td')[1].text;
      String duringDate = element.getElementsByTagName('td')[2].text;
      String duringCount = element.getElementsByTagName('td')[3].text;
      String postDate = element.getElementsByTagName('td')[4].text;
      dataList.add(SleepOutModel(
        number: number,
        name: name,
        duringDate: duringDate,
        duringCount: duringCount,
        postDate: postDate,
      ));
    });

    return dataList;
  } catch (_) {
    return [];
  }
}

Future<String> getSpecificNotice(String idx) async {
  final response = await dio.request(
    'https://dorm.hansung.ac.kr/kor/student/noti.do',
    data: {
      'pgMode': 'View',
      'idx': idx,
    },
    options: Options(
        method: 'POST', contentType: 'application/x-www-form-urlencoded'),
  );

  return response.toString();
}
