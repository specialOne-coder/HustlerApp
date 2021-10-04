import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/profil/conditions/conditionViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class ConditionPage extends StatelessWidget {
  const ConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<ConditionViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Conditions',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        width: size.width,
                      )
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => ConditionViewModel());
  }
}
