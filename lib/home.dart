

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_data_getx/datagetx.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final allData = Get.put(DataGetX());
    //final dataprovider = Provider.of<DataProvider>(context);
    
    allData.fetchData();

    return Container(
      child: allData.isLoading ? const Text('Loading ') :
        GetBuilder<DataGetX>(
          //init: DataGetX(),
          builder: ((controller) {
            return  ListView.builder(
              itemCount: allData.usersData.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Text('Last Name: ${allData.usersData[index].lastName}'),
                  ],
                ) ;
              })
            );
          })
        )
    );
  }
}