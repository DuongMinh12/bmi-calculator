import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_chart_devera/models/data.dart';
import 'package:ui_chart_devera/screens/items/item_screen.dart';

import '../constants/add_all.dart';

SliverAppBar sliverAppBarCustom(BuildContext context) {
  return SliverAppBar(
    backgroundColor: kMain,
    pinned: true,
    floating: true,
    expandedHeight: 180,
    leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
    actions: [
      IconButton(onPressed: () {
        Navigator.pushNamed(context, ItemScreen.routeName);
      }, icon: Icon(CupertinoIcons.plus))
    ],
    flexibleSpace: FlexibleSpaceBar(
      title: Text('Simple Budget'),
      background: Image.asset(
        bg,
        fit: BoxFit.cover,
      ),
    ),
    //backgroundColor: Image.asset('name'),
  );
}

List<String> days =['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'];

SliverToBoxAdapter sliverToBoxAdapterChart() {
  return SliverToBoxAdapter(
    child: Container(
      decoration: boxDecorationCard(),
      // shadowColor: Colors.grey.shade100,
      // elevation: 3,
      margin: EdgeInsets.only(top: 15, left: 15,right: 15, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Weekly Spending', style: txt18w500,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_left)),
                Text('Jun 05, 2022 - Jun 11, 2022', style: txt15,),
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_right)),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: 180,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (context, index){
                    return  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('\$${weeklySpending[index].toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.w500),),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            width: 20,
                            height: weeklySpending[index],
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kMain
                            ),
                          ),
                          Text(days[index], style: TextStyle(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ),
  );
}

BoxDecoration boxDecorationCard() {
  return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              spreadRadius: 3,
              blurRadius: 3,
              color: Colors.grey.shade200
          )
        ]
    );
}

double coutTotal(int index){
  int n = categories[index].expenses.length;
  double sum = 0.0;
  for(int i = 0; i < n; i++){
    sum += categories[index].expenses[i].cost ;
  }
  return sum;
}

double count(double amout ,int index){
  double total = (amout / categories[index].maxAmount) ;
  return total;
}

bool middle(int index, double count){
  double midd = categories[index].maxAmount/2;
  if(coutTotal(index)>=midd){
    return true;
  }
  return false;
}