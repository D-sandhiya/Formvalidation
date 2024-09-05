import 'package:flutter/material.dart';
import 'package:validationpage/GlobalComponents/GlobalFunction.dart';
import 'GlobalColors.dart';
import 'Profile.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _sexController = TextEditingController();
  final _addressController = TextEditingController();
  final _pincodeController = TextEditingController();
  List<String> Registration = [];

  void _clearForm() {
    _nameController.clear();
    _ageController.clear();
    _sexController.clear();
    _addressController.clear();
    _pincodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'User Details',
          style: TextStyle(color: GlobalAppColor.WhiteColorCode),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GlobalFunction.ProfileDetails.isEmpty
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Name'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Age'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        hintText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Sex'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _sexController,
                      decoration: InputDecoration(
                        hintText: 'Sex',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your sex';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Address'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        hintText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Pincode'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _pincodeController,
                      decoration: InputDecoration(
                        hintText: 'Pincode',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your pincode';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _clearForm,
                          child: Text('Clear'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Registration.add(_nameController.text);
                              Registration.add(_ageController.text);
                              Registration.add(_sexController.text);
                              Registration.add(_addressController.text);
                              Registration.add(_pincodeController.text);
                              GlobalFunction.ProfileDetails.addAll(
                                  Registration);
                              print(GlobalFunction.ProfileDetails[3]);
                              print(GlobalFunction.ProfileDetails.length);
                              Navigator.pop(context);
                              //  Profile(Profiledetails: Registration);
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
                'Your details Already Registered.',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
    );
  }
}
