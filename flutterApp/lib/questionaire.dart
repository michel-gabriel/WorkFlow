import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './textWidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './questionaireResponse.dart';
import './customRadioButton.dart';
import 'package:flutterApp/widgets.dart';

class Questionaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<int> recordedValues = new List(20);

void setValue(int index, int newValue) {
  recordedValues[index] = newValue; 
  print("RECORDED VALUE AT INDEX [$index] IS: $newValue");
}

class _MyHomePageState extends State<MyHomePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final productKnowledgeController = TextEditingController();
  final productFeasabilityController = TextEditingController();
  final marketKnowledgeController = TextEditingController();
  final marketEducationAbilityController = TextEditingController();
  final customerPersonaKnowledgeController = TextEditingController();
  final customerBuyExecutionController = TextEditingController();
  final competitionKnowledgeController = TextEditingController();
  final competitionExecutionController = TextEditingController();
  final founderExperienceInMarketController = TextEditingController();
  final founderBusinessExperienceController = TextEditingController();
  final founderCoachableFounderController = TextEditingController();
  final overallController = TextEditingController();
  final feedbackForFounderController = TextEditingController();
  final internalFeedbackController = TextEditingController();
  final inputText = "Please rate from 1-5";
  var pitchName = 'pitchNameHere';
  

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    productKnowledgeController.dispose();
    productFeasabilityController.dispose();
    marketKnowledgeController.dispose();
    marketEducationAbilityController.dispose();
    customerPersonaKnowledgeController.dispose();
    customerBuyExecutionController.dispose();
    competitionKnowledgeController.dispose();
    competitionExecutionController.dispose();
    founderExperienceInMarketController.dispose();
    founderBusinessExperienceController.dispose();
    founderCoachableFounderController.dispose();
    overallController.dispose();
    feedbackForFounderController.dispose();
    internalFeedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    Map map = {
      'pitchName': 'Pitch Name',
      'firstName': 'Product Knowledge',
      'lastName': 'Product Feasability',
      'email': 'Market Knowledge',
      'productKnowledge': 'Product Knowledge',
      'productFeasability': 'Product Feasability',
      'marketKnowledge': 'Market Knowledge',
      'marketEducationAbility': 'Market Education',
      'customerPersonaKnowledge': 'Customer PersonaKnowledge',
      'customerBuyExecution': 'customerBuyExecution',
      'competitionKnowledge': 'competitionKnowledge',
      'competitionExecution': 'competitionExecution',
      'founderExperienceInMarket': 'founderExperienceInMarket',
      'founderBusinessExperience': 'founderBusinessExperience',
      'founderCoachableFounder': 'founderCoachableFounder',
      'overall': 'overall',
      'feedbackForFounder': 'feedbackForFounder',
      'internalFeedback': 'internalFeedback',
    };

    Future<void> addAssessment() {
      const url = 'https://projectworkflow.firebaseio.com/Assessments.json';
      return http.post(
        url,
        body: json.encode(
          {
            'pitchName': pitchName,
            'firstName': firstNameController.text,
            'lastName': lastNameController.text,
            'email': emailController.text,
            'productKnowledge': productKnowledgeController.text,
            'productFeasability': productFeasabilityController.text,
            'marketKnowledge': marketKnowledgeController.text,
            'marketEducationAbility': marketEducationAbilityController.text,
            'customerPersonaKnowledge': customerPersonaKnowledgeController.text,
            'customerBuyExecution': customerBuyExecutionController.text,
            'competitionKnowledge': competitionKnowledgeController.text,
            'competitionExecution': competitionExecutionController.text,
            'founderExperienceInMarket':
                founderExperienceInMarketController.text,
            'founderBusinessExperience':
                founderBusinessExperienceController.text,
            'founderCoachableFounder': founderCoachableFounderController.text,
            'overall': overallController.text,
            'feedbackForFounder': feedbackForFounderController.text,
            'internalFeedback': internalFeedbackController.text,
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          pitchName,
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            screenSize.width * 0.10,
            10,
            screenSize.width * 0.10,
            10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: MyImageWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: firstNameController,
                      decoration:
                          const InputDecoration(helperText: "First name"),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: lastNameController,
                      decoration:
                          const InputDecoration(helperText: "Last name"),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: emailController,
                      decoration:
                          const InputDecoration(helperText: "Email on file"),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Product',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(0, map['productKnowledge']),
              textClass(
                'Feasability',
              ),
              Response(1, map['productFeasability']),

              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Market',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(2, map['marketKnowledge']),
              textClass(
                'Education Ability',
              ),
              Response(3, map['marketExecutionAbility']),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Customer Questions',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              
              textClass(
                'Knowledge',
              ),
              Response(4, map['customerPersonaKnowledge']),
              textClass(
                'Execution',
              ),
              Response(5, map['customerBuyExecution']),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Competition',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(6, map['competitionKnowledge']),
              textClass(
                'Execution',
              ),
              Response(7, map['competitionExecution']),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Team',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Knowledge',
              ),
              Response(8, map['founderExperienceInMarket']),
              textClass(
                'Execution',
              ),
              Response(9, map['founderBusinessExperience']),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'The Founder',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Founder Coachable Founder',
              ),
              Response(10, map['founderCoachableFounder']),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Overall',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'Overall',
              ),
              Response(11, map['overall']),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                  Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.red,
                      height: 80,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              textClass(
                'External',
              ),
              TextField(
                controller: feedbackForFounderController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please leave feedback for the founder [external]",
                ),
                maxLines: null,
                textAlign: TextAlign.center,
              ),
              textClass(
                'Internal',
              ),
              TextField(
                controller: internalFeedbackController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please leave feedback for the founder [internal]",
                ),
                maxLines: null,
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  map['pitchName'] = pitchName;
                  map['firstName'] = firstNameController.text;
                  map['lastName'] = lastNameController.text;
                  map['email'] = emailController.text;
                  map['productKnowledge'] = productKnowledgeController.text;
                  map['productFeasability'] = productFeasabilityController.text;
                  map['marketKnowledge'] = marketKnowledgeController.text;
                  map['marketEducationAbility'] =
                      marketEducationAbilityController.text;
                  map['customerPersonaKnowledge'] =
                      customerPersonaKnowledgeController.text;
                  map['customerBuyExecution'] =
                      customerBuyExecutionController.text;
                  map['competitionKnowledge'] =
                      competitionKnowledgeController.text;
                  map['competitionExecution'] =
                      competitionExecutionController.text;
                  map['founderExperienceInMarket'] =
                      founderExperienceInMarketController.text;
                  map['founderBusinessExperience'] =
                      founderBusinessExperienceController.text;
                  map['founderCoachableFounder'] =
                      founderCoachableFounderController.text;
                  map['overall'] = overallController.text;
                  map['feedbackForFounder'] = feedbackForFounderController.text;
                  map['internalFeedback'] = internalFeedbackController.text;

                  // Nick Function here
                  addAssessment();

                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(map['pitchName'] +
                            '\n' +
                            map['firstName'] +
                            '\n' +
                            map['lastName'] +
                            '\n' +
                            map['email'] +
                            '\n' +
                            map['productKnowledge'] +
                            '\n' +
                            map['productFeasability'] +
                            '\n' +
                            map['marketKnowledge'] +
                            '\n' +
                            map['marketEducationAbility'] +
                            '\n' +
                            map['customerPersonaKnowledge'] +
                            '\n' +
                            map['customerBuyExecution'] +
                            '\n' +
                            map['competitionKnowledge'] +
                            '\n' +
                            map['competitionExecution'] +
                            '\n' +
                            map['founderExperienceInMarket'] +
                            '\n' +
                            map['founderBusinessExperience'] +
                            '\n' +
                            map['founderCoachableFounder'] +
                            '\n' +
                            map['overall'] +
                            '\n' +
                            map['feedbackForFounder'] +
                            '\n' +
                            map['internalFeedback']),
                      );
                    },
                  );
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
