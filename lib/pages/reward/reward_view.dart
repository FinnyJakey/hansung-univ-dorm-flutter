import 'package:flutter/material.dart';
import 'package:hansungunivdorm/pages/widgets/reward_widgets.dart';

class RewardView extends StatelessWidget {
  const RewardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          rewardWidget(
            '선행점(상점) 기준표 (생활관 임의 하에 상점부여)',
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '학교 및 생활관의 명예와 발전에 공적이 인정되는 자',
                  style: TextStyle(height: 2.0),
                ),
                Divider(),
                Text(
                  '화재발생 등 위급사항에 솔선수범하여 신속대처한 자',
                  style: TextStyle(height: 2.0),
                ),
                Divider(),
                Text(
                  '긴급환자 발생 시 신속히 응급조치한 자',
                  style: TextStyle(height: 2.0),
                ),
                Divider(),
                Text(
                  '생활관에서 시행되는 주요행사에 적극 참여한 자',
                  style: TextStyle(height: 2.0),
                ),
                Divider(),
                Text(
                  '기타 교육 및 만족도 조사 참여 등 생활관 운영에 공이 인정되는 자',
                  style: TextStyle(height: 2.0),
                ),
              ],
            ),
          ),
          punishmentWidget(
            '벌점 기준표',
            Column(
              children: [
                punishmentWidget(
                  '20점(강제퇴사)',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '외부인 숙박시킨 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '네트워크상에 유언비어 또는 음란물을 배포한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '인화물질 및 위험물을 사용한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '사행 행위 및 무단 불법 집회를 하거나 그 장소를 제공한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '절도 행위를 한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '음주 난동 및 폭력 행위를 한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '성희롱 및 성추행 한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '시설물 및 집기 비품을 파손하거나 훼손한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '학칙 위반으로 유기 정학 이상의 징계 처분을 받은 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '관리자의 정당한 지시에 불복한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '기타 위의 각 호에 준하는 위반 행위를 한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '생활관 내에서 흡연한 자, 음주한 자 (보관 포함) (男 기숙사의 경우 옥상포함)',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '(상상빌리지) 이성층에 침입한 자',
                        style: TextStyle(height: 2.0, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '16점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '배정된 호실을 임의로 변경한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '애완동물 (포유류, 조류, 파충류, 양서류, 관상어류 등)을 사육한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '출입게이트의 비정상적인 이용 또는 허용되지 않은 통로(창문, 테라스)를 통해 무단출입하는 자',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '10점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '인화물질 및 위험물 반입자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '허가되지 않은 전열 기구를 사용한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '타인 명의의 우편물을 수취 혹은 개봉한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '외부인을 무단으로 동반하거나 열쇠를 타인에게 준 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '점호 이후 무단으로 외출한 자(외박계 작성 유무와 상관없음)',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '6점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '사내 소란행위 및 소음을 유발한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '기숙사OT에 무단으로 참석하지 않은 자 (사전 보고 후 결석 3점, 지각1점, 10분 이후 지각 2점)',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '출입카드 및 열쇠를 분실한 자(다음학기 입사 기준에 벌점 적용)',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '5점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '외박 신청을 하지 않고 외박한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '퇴실 시, 청소상태가 불량(욕실 포함)한 자(다음학기 입사 제한)',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '룸메이트에게 불편을 끼친 자(12:30분 이후 노트북 및 소란, 통화, 악취, 빛과 소음 등)',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '출입문 폐쇄 시간에 기숙사를 들어오는 자(외박계 작성 유무와 상관없음)',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '4점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '사내 집기를 지정장소 이외로 이동한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '시설물에 허가되지 않은 부착물을 붙인 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '공동생활 공간 (예: 복도, 휴게실, 로비 등) 에 개인 물품을 방치 하거나 지저분하게 사용한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '점호이후 외부음식을 반입한 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '공공 시설물을 부적합한 용도로 사용한 자',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '3점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '룸메이트의 동의 없이 다른 방 사생을 출입시킨 자(출입학생, 출입시킨 학생 양측 모두)',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '각 방의 청소상태가 불량한 자 (점호 시에 재점검 할 수 있음)',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '지정장소 외 다른 장소에 택배를 시키는자',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '2점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '쓰레기를 분리하여 버리지 않은 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '생활관 규칙에 위배된 행동을 한 자를 알고도 신고하지 않은 자',
                        style: TextStyle(height: 2.0),
                      ),
                      Divider(),
                      Text(
                        '출입카드 및 열쇠 미소지 및 게이트 무단 통과하여 경고를 받은 자',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '1점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '점호불참으로 경고를 받은 자(외박계 작성유무와 상관없음)',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
                punishmentWidget(
                  '상응한 벌점',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '기타 제반 지시 사항을 불이행한 자 및 사감이 벌점 부여가 필요하다고 판단한 자',
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: const [
                Text(
                  'ㆍ단기 외박',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(' : 7박 8일 까지'),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: const [
                Text(
                  'ㆍ장기 외박',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(' : 8박 9일부터(관련서류 필요)'),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '※강제퇴사 :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 2.0,
                  ),
                ),
                Text(
                  '- 벌점의 합이 20점 이상인 자',
                  style: TextStyle(height: 2.0),
                ),
                Text(
                  '- 벌점의 합이 20점 이상이 되지 않아도 사내 질서를 현저히 문란하게 하는 자와 위반행위에 대하여 반성의 빛이 없는 자는 벌점에 관계없이 즉시 강제 퇴사시킬 수 있다.',
                  style: TextStyle(height: 2.0),
                ),
                Text(
                  '- 정해진 기간 동안 건강검진을 받지 않은 자는 강제퇴사 처리할 수 있다.',
                  style: TextStyle(height: 2.0),
                ),
                Text(
                  '- 기숙사 입사 시 보고하지 않은 질병․특정 증상이 발견될 경우 강제 퇴사시킬 수 있다.',
                  style: TextStyle(height: 2.0),
                ),
                Text(
                  '※입사제한 :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 2.0,
                  ),
                ),
                Text(
                  '- 벌점 20점 이상 - 영구입사 제한.',
                  style: TextStyle(height: 2.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
