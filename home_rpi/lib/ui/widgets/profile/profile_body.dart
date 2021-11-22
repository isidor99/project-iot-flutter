import 'package:flutter/material.dart';

import 'package:home_rpi/models/user.dart';
import 'package:home_rpi/ui/widgets/icon_text.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody(this.user, {Key? key}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          IconText(Icons.account_circle, user!.getFullName()),
          const SizedBox(
            height: 24,
          ),
          IconText(Icons.date_range, user!.getFormattedDate()),
          const SizedBox(
            height: 24,
          ),
          IconText(Icons.email, user!.email),
          const SizedBox(height: 24),
          IconText(Icons.person, user!.username)
        ],
      ),
    );
  }
}
