import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordDataCustomer extends StatelessWidget {
  RecordDataCustomer({Key? key}) : super(key: key);

  final name = TextEditingController();
  final emailAddress = TextEditingController();
  final contactNumber = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  void recordData() {
    firestore.collection('Customer').add({
      "Name": name.text,
      "Email": emailAddress.text,
      "Contact": contactNumber.text,
    });

    name.clear();
    emailAddress.clear();
    contactNumber.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("บันทึกข้อมูลลูกค้า"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text(
                  'ชื่อ - นามสกุล',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: fristnameLastname(),
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: email(),
                ),
                const Text(
                  'เบอร์โทร',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: contact(),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: FloatingActionButton.extended(
                    label: const Text('บันทึกข้อมูล'),
                    heroTag: 'บันทึกข้อมูล',
                    backgroundColor: const Color.fromARGB(255, 65, 200, 241),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        recordData();
                        Fluttertoast.showToast(msg: "บันทึกข้อมูลสำเร็จ");
                      } else {
                        Fluttertoast.showToast(msg: "บันทึกข้อมูลไม่สำเร็จ");
                      }
                    },
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox fristnameLastname() {
    return SizedBox(
      width: 325,
      child: TextFormField(
        style: const TextStyle(fontSize: 16, color: Colors.black),
        keyboardType: TextInputType.text,
        controller: name,
        decoration: InputDecoration(
          labelText: 'ชื่อ - นามสกุล',
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

  SizedBox email() {
    return SizedBox(
      width: 325,
      child: TextFormField(
        style: const TextStyle(fontSize: 16, color: Colors.black),
        keyboardType: TextInputType.emailAddress,
        controller: emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
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

  SizedBox contact() {
    return SizedBox(
      width: 325,
      child: TextFormField(
        maxLength: 10,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        keyboardType: TextInputType.phone,
        controller: contactNumber,
        decoration: InputDecoration(
          labelText: 'เบอร์',
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
}
