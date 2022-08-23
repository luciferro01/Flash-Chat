import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'message_bubble.dart';

class MessageStream extends StatefulWidget {
  @override
  State<MessageStream> createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  final _firebase = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  late User  loggedInUser;

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser!;
      if(user != null){
        loggedInUser = user;
        print('${loggedInUser.email}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    // print(object)
  }

  // var currentUser = _loggedInUser.email;
  @override
  Widget build(BuildContext context) {
    // getCurrentUser();
    return StreamBuilder<QuerySnapshot>(
      stream: _firebase
          .collection('messages')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, streamSnapshot) {
        if (!streamSnapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        // Map<String, dynamic> data;
        // final messages = snapshot.data!.docs.map(
        //   (document) {
        //     data = document.data()! as Map<String, dynamic>;
        //     // return ListView.builder(itemCount: , itemBuilder: (context, int index){ return}
        //     return ListView(
        //       children: [
        //         Card(
        //           child: Text(
        //             data['text'],
        //           ),
        //         ),
        //       ],
        //     );
        //     },
        //   );
        final documents = streamSnapshot.data?.docs;
        return Expanded(
          // height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
            reverse: true,
            itemCount: documents?.length,
            itemBuilder: (context, index) => Container(
              // padding: (loggedInUser.email == documents![index]['sender']) ? EdgeInsets.only(left: 90, top: 10, bottom: 10, right: 30) : EdgeInsets.only(left: 30, right: 90, bottom: 10, top: 10) ,
              child: MessageBubble(index, documents, 'text',
                  loggedInUser.email == documents![index]['sender']),
            ),
          ),
        );
      },
    );
  }
}
