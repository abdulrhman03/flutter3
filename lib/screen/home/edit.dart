import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_p2/screen/home/home11.dart';
import 'package:get/get.dart';

import '../config/curent.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final users = FirebaseAuth.instance.currentUser!;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override

  void initState() {
    super.initState();
    // Pre-fill the form with the user's current data
    nameController.text = CurrentSession().user!.displayName ?? '';
    phoneNumberController.text = CurrentSession().user!.phoneNumber ?? '';
  }

  void updateUserData() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final updatedData = {
        'displayName': nameController.text,
        'phoneNumber': phoneNumberController.text,
      };

      FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update(updatedData)
          .then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User data updated successfully.'),
          ),
        );
      })
          .catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating user data: $error'),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            ElevatedButton(
              onPressed: () {
                updateUserData();
              },
              child: Text('Save Changes'),
            ),    ElevatedButton(
              onPressed: () {

               Get.to(()=>HomeScreen11());
              },
              child: Text('profile'),
            ),
          ],
        ),
      ),
    );
  }
}
