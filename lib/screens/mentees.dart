import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skill_share_admin/config/styles.dart';


class Mentees extends StatelessWidget {
  const Mentees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Mentors")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final mentors = snapshot.data?.docs ?? [];

          if (mentors.isEmpty) {
            return const Center(
              child: Text('There Are No Request.'),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: ListView.builder(
              itemCount: mentors.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot<Map<String, dynamic>> mentorDoc =
                    mentors[index];
                Map<String, dynamic> data = mentorDoc.data();
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.013,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          onTap: () {
                            
                          },
                          leading: Image.asset("assets/user (2).png"),
                          title: Text(
                            data['username'] ?? '',
                            style: Styles.subtitle(context),
                          ),
                          subtitle: Text(
                            "email: ${data['email']}",
                            style: Styles.labelText(context),
                          ),
                          
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
