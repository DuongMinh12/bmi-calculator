import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_chart_devera/constants/add_all.dart';
import 'package:ui_chart_devera/models/data.dart';
import 'package:ui_chart_devera/screens/items/item_screen.dart';
// import 'package:ui_chart_devera/models/category_model.dart';

import '../../widgets/home_widget.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBarCustom(context),
          sliverToBoxAdapterChart(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: boxDecorationCard(),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder:  (context)=> ItemScreen(title: categories[index].name,
                            local: index,
                          amountItem: coutTotal(index),)));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(categories[index].name, style: txt15,),
                            Text('\$${coutTotal(index).toStringAsFixed(2)} \/ \$${categories[index].maxAmount}', style: txt15,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        LinearProgressIndicator(
                          minHeight: 18,
                          value: count(coutTotal(index), index),
                          color: middle(index, coutTotal(index))? kMain : Colors.orange ,
                          backgroundColor: Colors.grey.shade200,
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
