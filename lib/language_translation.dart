import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {

  var languages = ["Hindi", "English", "Gujarati"];
  var originLanguage = 'from';
  var destinationLanguage = 'To';
  var output = '';
  TextEditingController languageController = TextEditingController();

void translate(String src, String dest, String input) async{
  GoogleTranslator translator =  GoogleTranslator();
  var translation = await translator.translate(input, from: src, to : dest);
  setState(() {
    output = translation.text.toString();
  });

  if(src =='--' || dest=='__') {
    setState(() {
      output = " Fail to Translate";


    });

  }
}

String getLanguageCode(String language) {
  if(language =="English") {
    return "en";
  } else if (language=="Hindi"){
    return "hi";
  }else if (language=="Gujarati") {
    return "guj";
  }
  return "--";

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0755cc),
      appBar: AppBar(
        title: Text(" BOUNDARIES "), centerTitle: true,
        backgroundColor: Color(0xffe3e314),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(focusColor: Colors.white,
                    iconDisabledColor:  Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      originLanguage,style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),);

                    }).toList(),
                    onChanged: (String? value){
                    setState(() {
                      originLanguage = value!;
                    });
                    },
                  ),

                  SizedBox(width:40,),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.white, size: 40,),
                  SizedBox(width: 40,),



                  DropdownButton(focusColor: Colors.white,
                    iconDisabledColor:  Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      destinationLanguage,style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),);

                    }).toList(),
                    onChanged: (String? value){
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),


                ],


              ),
              SizedBox(height: 40,),
              Padding(padding: EdgeInsets.all(8),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter Word or Sentence For Translation.......',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,

                    )

                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  Colors.white,width: 1,),
                  ),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                ),
                controller: languageController,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'please enter text to translate';
                  }
                  return null;

                },
              ) ,
              ),



              Padding(padding: EdgeInsets.all(8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(
                      0xffe3d91a)) ,
                  onPressed: () {
                    translate(getLanguageCode(originLanguage), getLanguageCode(destinationLanguage), languageController.text.toString());
                    },
                  child: Text("Translate")),
              ),
              SizedBox(height: 20,),
              Text(
                "\n$output",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),

              )






            ],
          ),

        ),
      ),
      
    );
  }
}
