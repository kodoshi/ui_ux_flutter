
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          PopupMenuButton<Actions>(
            icon: const Icon(Icons.more_vert),
            onSelected: (Actions result) async {
              switch (result) {
                case Actions.logout:
                  break;
                case Actions.deleteAccount:
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Actions>>[
              const PopupMenuItem<Actions>(
                value: Actions.logout,
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
              const PopupMenuItem<Actions>(
                value: Actions.deleteAccount,
                child: ListTile(
                  minLeadingWidth: 0,
                  leading: Icon(Icons.delete_forever_sharp),
                  title: Text('Delete account'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

enum Actions { logout, deleteAccount }
