import 'package:flutter/material.dart';

import 'package:home_rpi/models/user.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader(this._user, {Key? key}) : super(key: key);

  final User? _user;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: SizedBox(
          height: 256,
          child: Container(
            color: Theme.of(context).primaryColorLight,
            child: Center(
              child: Container(
                width: 192,
                height: 192,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: _user!.profileImage.isNotEmpty
                          ? NetworkImage(_user!.profileImage)
                          : const AssetImage("assets/rpi.webp") as ImageProvider),
                  borderRadius: const BorderRadius.all(Radius.circular(96)),
                ),
              ),
            ),
          )),
    );
  }
}
