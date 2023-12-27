import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100, // Set a specific height for the active status section
            child: _buildActiveStatus(),
          ),
          Expanded(
            child: _buildChatList(),
          ),

        ],
      ),
    );
  }

  Widget _buildActiveStatus() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Replace with the actual number of active users
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                //every story
                print('clicked on $index');
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('https://source.unsplash.com/150x150/?portrait'),
                  ),
                  SizedBox(height: 4),
                  Text('User $index'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      itemCount: 10, // chat counts
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://source.unsplash.com/200x200/?portrait'),
          ),
          title: Text('Username $index'),
          subtitle: Text('Last message from user $index'),
          onTap: () {
            // chat screen
          },
        );
      },
    );
  }

}