import 'package:flutter/material.dart';
import 'package:snapvids_app/common/routes/routes.dart';
import 'package:snapvids_app/common/store/login_store.dart';
import 'package:snapvids_app/common/widgets/space.dart';
import 'package:snapvids_app/common/widgets/toast.dart';
import 'package:snapvids_app/http/apis/login_api.dart';

class ProfilePage extends StatefulWidget {
  final int index;

  const ProfilePage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Profile Page'),
            const Space(direction: Axis.vertical),
            ElevatedButton(
              onPressed: () async {
                LoginApi.logout().then((result) {
                  LoginStore.removeToken();
                  Toast.show('登出成功');
                  Navigator.pushNamedAndRemoveUntil(context, Routes.index, (route) => false);
                });
              },
              child: const Text('登出'),
            ),
          ],
        ),
      ),
    );
  }
}
