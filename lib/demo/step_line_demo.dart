import 'package:flutter/material.dart';

class StepDemo extends StatefulWidget {
  @override
  _StepDemoState createState() => _StepDemoState();
}

class _StepDemoState extends State<StepDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                  currentStep: _currentStep,
                  onStepTapped: (int index) {
                    setState(() {
                      _currentStep = index;
                    });
                  },
                  onStepContinue: () {
                    setState(() {
                      _currentStep < 2 ? _currentStep++ : _currentStep = 0;
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      _currentStep > 0 ? _currentStep-- : _currentStep = 0;
                    });
                  },
                  steps: [
                    Step(
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content:
                          Text('Magna exercitation duis non sint eu nostrud.'),
                      isActive: _currentStep == 0,
                    ),
                    Step(
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content:
                          Text('Magna exercitation duis non sint eu nostrud.'),
                      isActive: _currentStep == 1,
                    ),
                    Step(
                      title: Text('Login'),
                      subtitle: Text('Login first'),
                      content:
                          Text('Magna exercitation duis non sint eu nostrud.'),
                      isActive: _currentStep == 2,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
