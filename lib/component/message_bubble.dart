import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final documents;
  final int index;
  final String text;
  final bool user;

  MessageBubble(this.index, this.documents, this.text, this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:  user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        // Text(documents[index]['sender'], style: TextStyle(color: Colors.white),),
        Padding(
          padding:  user ? EdgeInsets.only(left: 90, bottom: 10, right: 20 , top: 10) : EdgeInsets.only(right: 90, bottom: 10, left: 20 , top: 10) ,
          child: Material(
            elevation: 6.0,
            shadowColor: Colors.white,
            borderRadius: user? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ) : const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ) ,
            color: user ? Colors.black87 : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                documents![index][text],
                style: TextStyle(
                  color: user ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
