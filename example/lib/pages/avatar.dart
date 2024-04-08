import 'package:buffalo_design/buffalo_design.dart';
import 'package:flutter/material.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key});

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: BFRow(
            spacing: 20,
            children: [
              BFColumn(
                margin: const EdgeInsets.only(top: 20),
                spacing: 20,
                children: [
                  BFAvatar(
                    imageUrl: '',
                    radius: 24,
                  ),
                  BFAvatar(
                    imageUrl: '',
                  ),
                  BFAvatar(
                    imageUrl: '',
                    alternativeName: "John Doe",
                    // radius: 24,
                  ),
                  BFAvatar(
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                  ),
                ],
              ),
              BFColumn(
                margin: const EdgeInsets.only(top: 20),
                spacing: 20,
                children: [
                  BFAvatar(
                    imageUrl: '',
                    badgeColor: Colors.orange,
                    showBadge: true,
                    radius: 24,
                  ),
                  BFAvatar(
                    imageUrl: '',
                    badgeColor: Colors.orange,
                    showBadge: true,
                    radius: 36,
                  ),
                  BFAvatar(
                    imageUrl: '',
                    alternativeName: "John Doe",
                    showBadge: true,
                  ),
                  BFAvatar.danger(
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    alternativeName: "John Doe",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
