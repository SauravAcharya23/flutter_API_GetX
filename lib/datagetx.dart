

import 'package:get/get.dart';
import 'package:get_data_getx/getServer.dart';
import 'package:get_data_getx/model/users.dart';

class DataGetX extends GetxController{

  bool isLoading  = false;
  //List<Data> usersData = [];
  List<Data> usersData = [];
  fetchData() async{
    Users users = await GetServer.getDataApi();
    isLoading = true;

    if(users.data != null){
      isLoading = false;
      usersData = users.data!;
      update();
      return usersData;
    }
    //update(usersData);

  }
  getUsersData() => usersData;
}