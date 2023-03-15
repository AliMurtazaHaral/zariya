import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Compaign_Form_Screen extends StatefulWidget {
  const Compaign_Form_Screen({Key? key}) : super(key: key);

  @override
  State<Compaign_Form_Screen> createState() => _Compaign_Form_ScreenState();
}

class _Compaign_Form_ScreenState extends State<Compaign_Form_Screen> {

final campaign_name_controller = TextEditingController();
final user_name_controller = TextEditingController();
final email_controller = TextEditingController();
final phone_number_controller = TextEditingController();
final cnic_controller = TextEditingController();
final city_controller = TextEditingController();
final address_contoller = TextEditingController();
final donation_target_controller = TextEditingController();

String? document;
String? campaign_document_details;

String? document_shower = "no document";
String? campaign_document_details_shower = "no document";



Future pickdocument(String document , String document_shower) async {
  final picked_document = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['pdf' , 'docx' , 'docm' , 'dot' , 'dotx']
  );
  if (picked_document == null) {
    if (document_shower == "no document") {
      Fluttertoast.showToast(msg: "No document selected");
    }
  } else {
    document = picked_document.files.single.path!;
    document_shower = document.split("/").last!;
  }
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3eb489),
        title: const Text(
            "Campaign Form"
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              EnterText.textfield(context , campaign_name_controller , "Campaign Name",1),
              EnterText.textfield(context, user_name_controller, "Username", 1),
              EnterText.textfield(context, email_controller, "Email", 1),
              EnterText.textfield(context, phone_number_controller, "Phone number", 1),
              EnterText.textfield(context, cnic_controller, "CNIC", 1),
              EnterText.textfield(context, city_controller, "City name", 1),
              EnterText.textfield(context, address_contoller, "Address", 2),
              EnterText.textfield(context, donation_target_controller, "Target amount", 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white)),
              elevation: 5,
              color: Colors.transparent,
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(52, 15, 52, 15),
                minWidth: MediaQuery.of(context).size.width * 0.3,
                onPressed: () async {
                  pickdocument(document! , document_shower!);
                },
                child: const Text(
                  "Document",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(document_shower!),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white)),
              elevation: 5,
              color: Colors.transparent,
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(52, 15, 52, 15),
                minWidth: MediaQuery.of(context).size.width * 0.3,
                onPressed: () async {
                  pickdocument(campaign_document_details! , campaign_document_details_shower!);
                },
                child: const Text(
                  "Campaign Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(campaign_document_details_shower!),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.white)),
              elevation: 5,
              color: const Color(0xFF3eb489),
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(52, 15, 52, 15),
                minWidth: MediaQuery.of(context).size.width * 0.3,
                onPressed: () async {
                  if(campaign_document_details_shower == "no document" ||
                     document_shower == "no document" ||
                      campaign_name_controller.text.isEmpty ||
                      user_name_controller.text.isEmpty ||
                      email_controller.text.isEmpty ||
                      phone_number_controller.text.isEmpty ||
                      cnic_controller.text.isEmpty ||
                      city_controller.text.isEmpty ||
                      address_contoller.text.isEmpty ||
                      donation_target_controller.text.isEmpty
                    ){
                    Fluttertoast.showToast(
                        msg: "Please add all the details");
                  }
                  else{
                    Fluttertoast.showToast(msg: "Details Successfully Added");

                    campaign_document_details_shower = "no document";
                    document_shower = "no document";
                    campaign_name_controller.text == "";
                        user_name_controller.text == "";
                        email_controller.text == "";
                        phone_number_controller.text == "";
                        cnic_controller.text == "";
                        city_controller.text == "";
                        address_contoller.text == "";
                        donation_target_controller.text == "";
                  }
                  setState(() {});
                },
                child: const Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

class EnterText {
  static Widget textfield(
      BuildContext context, TextEditingController controller, String hint , int lines) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        child: TextFormField(
          maxLines: lines,
          style: const TextStyle(color:  Color(0xFF3eb489)),
          keyboardType: TextInputType.text,
          //Text field data is stored in emailController
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Enter Valid Credentials");
            }
          },
          onSaved: (value) {
            controller.text = value!;
          },
          decoration: InputDecoration(
            fillColor: const Color(0xFF3eb489),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color:  Color(0xFF3eb489), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: false,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.blueGrey),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF3eb489), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
