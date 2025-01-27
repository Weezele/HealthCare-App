import 'package:flutter/material.dart';
import 'package:health_app/views/profile_page/components/profile_options.dart';
import 'components/profile_header.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              imageUrl: "assets/images/doctors/doctor_1.png",
              name: "Daniel Martinez",
              phoneNumber: "+123 856479683",
              onEdit: () {
               
              },
            ),
            const Divider(height: 1),
            ProfileOption(
              icon: Icons.person,
              title: "Edit Profile",
              onTap: () {
                
              },
            ),
            ProfileOption(
              icon: Icons.favorite,
              title: "Favorite",
              onTap: () {
              
              },
            ),
            ProfileOption(
              icon: Icons.notifications,
              title: "Notifications",
              onTap: () {
              
              },
            ),
            ProfileOption(
              icon: Icons.settings,
              title: "Settings",
              onTap: () {
                
              },
            ),
            ProfileOption(
              icon: Icons.help,
              title: "Help and Support",
              onTap: () {
                
              },
            ),
            ProfileOption(
              icon: Icons.description,
              title: "Terms and Conditions",
              onTap: () {
                
              },
            ),
            ProfileOption(
              icon: Icons.logout,
              title: "Log Out",
              onTap: () {
               
              },
            ),
          ],
        ),
      ),
    );
  }
}
