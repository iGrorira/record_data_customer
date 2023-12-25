import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchCustomer extends StatefulWidget {
  const SearchCustomer({Key? key}) : super(key: key);

  @override
  State<SearchCustomer> createState() => _SearchCustomerState();
}

class _SearchCustomerState extends State<SearchCustomer> {
  final input = TextEditingController();
  List<Map<String, dynamic>> customerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ค้นหาข้อมูล"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                inputData(),
                const SizedBox(width: 10),
                SizedBox(
                  height: 50,
                  width: 70,
                  child: FloatingActionButton.extended(
                    label: const Text('ค้นหา'),
                    heroTag: 'ค้นหา',
                    backgroundColor: const Color.fromARGB(255, 65, 200, 241),
                    onPressed: () {
                      searchCustomer();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: customerList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('ชื่อ - สกุล: ${customerList[index]['Name']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${customerList[index]['Email']}'),
                      Text('เบอร์โทร: ${customerList[index]['Contact']}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  SizedBox inputData() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        maxLength: 10,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        keyboardType: TextInputType.text,
        controller: input,
        decoration: InputDecoration(
          labelText: 'กรอกเบอร์โทร...',
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 0, 65, 117)),
          ),
        ),
      ),
    );
  }

  void searchCustomer() {
    String searchTerm = input.text;

    FirebaseFirestore.instance
        .collection('Customer') // Change this to your collection name
        .where('Contact', isEqualTo: searchTerm)
        .get()
        .then((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> result = [];
      querySnapshot.docs.forEach((doc) {
        result.add({
          'Name': doc['Name'],
          'Email': doc['Email'],
          'Contact': doc['Contact'],
        });
      });

      setState(() {
        customerList = result;
      });
    }).catchError((error) {
      print("Error getting documents: $error");
    });
  }
}
