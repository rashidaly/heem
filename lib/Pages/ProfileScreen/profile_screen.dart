import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heem/Models/user.dart';


class UserProfile extends StatefulWidget {


  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {


  Future<UserModel?> userName() async {
    User? user = FirebaseAuth.instance.currentUser;
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user?.uid);
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    }
    return null;
  }

  Widget buildUsers(UserModel users) => Center(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Container(
              //color: Colors.blueAccent,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                       Text(
                        users.name ?? '',
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold,
                        color: Colors.white
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Email: ',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        users.email ?? '',
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ])));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text('Profile'),
        ),
        body: Column(
          children: [
            FutureBuilder<UserModel?>(
              future: userName(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data;
                  return user == null
                      ? const Text('No data')
                      : buildUsers(user);
                } else {
                  return const Center(child: Text('No Data'));
                }
              },
            ),
          ],
        )
    );
  }
}
