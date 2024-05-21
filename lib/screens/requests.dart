import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skill_share_admin/config/styles.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Mentors")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("veterans")
            .where("isverified", isEqualTo: false)
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
                            "skill: ${data['skill']}",
                            style: Styles.labelText(context),
                          ),
                          trailing: IconButton(
                              onPressed: () async {
                                QuerySnapshot snapshot = await FirebaseFirestore.instance
                                    .collection("veterans")
                                    .where("email",
                                        isEqualTo: data['email'])
                                    .get();
                                final docid = snapshot.docs.first.id;
                                await FirebaseFirestore.instance
                                    .collection("veterans")
                                    .doc(docid)
                                    .update({"isverified":true});
                              },
                              icon: const Icon(
                                Icons.done,
                                color: Colors.black,
                              )),
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
