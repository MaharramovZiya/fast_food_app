import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const ListTile(
        title: Text(
          "Hello, Aris",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        subtitle: Text('What you want eat today?'),
      ),
      actions: [
        CircleAvatar(
          radius: 50,
          child: ClipOval(
            child: Image.asset(
              'assets/icons/soda.png',
              width: 40, // Resmin genişliğini ve yüksekliğini belirleyin
              height: 40,
              fit: BoxFit
                  .contain, // Resmin avatar içinde tamamen görünmesini sağlar
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
