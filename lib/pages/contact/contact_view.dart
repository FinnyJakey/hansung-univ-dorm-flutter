import 'package:flutter/material.dart';

import '../widgets/contact_widget.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          contactWidget(context, '행정실', '상상빌리지 122호', '08:00 ~ 24:00',
              '02-760-8078', '02-742-7733'),
          contactWidget(context, '사감실', '상상빌리지 119호', '24:00 ~ 08:00',
              '02-760-8079', '02-742-7733'),
          contactWidget(context, '학생장학팀', '진리관 105호', '09:00 ~ 17:30',
              '02-760-4221', '02-760-4305'),
        ],
      ),
    );
  }
}
