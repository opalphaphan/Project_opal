import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late User _user;
  String bio =
      "briize? did you enjoy today's\nas soon as i saw briize today, i felt so happy hehe\nso i think i’m comfortable inside. that's what i thought\nthe cheers that i heard after a long time gave me...";
  String currentCollection = '';
  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
  }

  void _editBio(BuildContext context) {
    TextEditingController _bioController = TextEditingController();
    _bioController.text = bio;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Bio'),
        content: TextField(
          controller: _bioController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Enter your new bio here',
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                bio = _bioController.text;
              });
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showDataList(String collection) {
    setState(() {
      currentCollection = collection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
           centerTitle: true,
          title: Image.asset(
            'lib/assets/profile.png',
            height: 70,
          ),
          backgroundColor: Color.fromRGBO(87, 144, 223, 1.0),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('lib/assets/anton.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                '${_user.email}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                  SizedBox(
                    child: _buildButton(context, 'Like', Icons.thumb_up, 'LikedBooks'),
                  ),
                  SizedBox(
                  child: _buildButton(context, 'Save', Icons.save, 'SavedBooks'),
                  ),
                  SizedBox(
                    child: _buildButton(context, 'Finish', Icons.check, 'FinishedBooks'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _buildInfoSection('Level 7', 'Time Record : 220 min',
                          'Book Record : 7'),
                      SizedBox(height: 20),
                      _buildBioSection(),
                      SizedBox(height: 20),
                      if (currentCollection.isNotEmpty)
                        _buildDataList(currentCollection),
                    ],
                  ),
                ),
              ),
              Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                  SizedBox(
                    child: _buildButton(context, 'Edit', Icons.edit, ''),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, IconData iconData,
      String collection) {
    return ElevatedButton.icon(
      icon: Icon(iconData),
      label: Text(title),
      onPressed: () {
        if (title != 'Edit') {
          _showDataList(collection);
        } else {
          _editBio(context);
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String level, String timeRecord, String bookRecord) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(level,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(timeRecord, style: TextStyle(fontSize: 16)),
          Text(bookRecord, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildBioSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bio',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            bio,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildDataList(String collection) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              collection,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection(collection).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(doc['title']),
                    subtitle: Text(doc['author']),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
