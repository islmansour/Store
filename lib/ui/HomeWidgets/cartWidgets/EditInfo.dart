import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

// ignore: must_be_immutable
class EditInfo extends StatelessWidget {
  String fullName;
  String adress;
  String phone;
  String country;
  int zipCode;

  EditInfo({this.fullName, this.adress,this.country,this.phone, this.zipCode});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController =
        TextEditingController(text: fullName);
    TextEditingController adressController =
        TextEditingController(text: adress);
    TextEditingController zipCodeController =
        TextEditingController(text: zipCode.toString());
    TextEditingController phoneController =
    TextEditingController(text: phone);
    TextEditingController countryController =
    TextEditingController(text: country);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.first,
        title: Text(
          'Adress',
          style: TextStyle(
            color: Colors.black,
              fontFamily: Roboto.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context, [
                fullNameController.text,
                adressController.text,
                zipCodeController.text
              ]);
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 10,
          right: 10
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'Full Name',
              style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxStyle.withShadow,
            child: TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Text(
            'Address',
            style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxStyle.withShadow,
            child: TextField(
              controller: adressController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          Text(
            'Country',
            style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxStyle.withShadow,
            child: TextField(
              keyboardType: TextInputType.text,
              controller: countryController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          Text(
            'Phone',
            style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxStyle.withShadow,
            child: TextField(
              keyboardType: TextInputType.text,
              controller: phoneController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          Text(
            'Zip Code',
            style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxStyle.withShadow,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: zipCodeController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
