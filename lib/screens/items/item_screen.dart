import 'package:flutter/material.dart';
import 'package:ui_chart_devera/constants/add_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_chart_devera/models/data.dart';
import 'package:ui_chart_devera/models/expense_model.dart';
import 'package:ui_chart_devera/screens/home/home_screen.dart';
import 'package:ui_chart_devera/widgets/home_widget.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen({Key? key, required this.title,  required this.local,
  required this.amountItem}) : super(key: key,);
  static String routeName='itemScreen';
  String title;
  Expense expense = Expense();
  int local;
  double amountItem;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMain,
        title: Text(title),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.plus))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 16),
              padding: EdgeInsets.all(15),
              decoration: boxDecorationCard(),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: CircularProgressIndicator(
                      value: count(amountItem, local),
                      strokeWidth: 12,
                      backgroundColor: Colors.grey.shade200,
                      color: middle(local, amountItem)? kMain: Colors.orange,
                    ),
                  ),
                  Positioned(
                    top: 35,
                      left: 105,
                    child: Container(
                      alignment: Alignment.center,
                    height: 100,

                   child: Text('\$${amountItem.toStringAsFixed(2)}/\$${categories[local].maxAmount}', style: txt18w500,),
                  ))
                ],
              ),
            ),
            Container(
              height: 470,
              child: ListView.builder(
                itemCount: categories.length,
                  itemBuilder: (context, index){
                return Container(
                  decoration: boxDecorationCard(),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(categories[index].expenses[index].name, style: txt16bold,),
                      Text('-\$${categories[local].expenses[index].cost.toStringAsFixed(2)}', style: txt16bold!.copyWith( color: Colors.red),),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
