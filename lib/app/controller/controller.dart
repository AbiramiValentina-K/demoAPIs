import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'extensions.dart';

class Controller extends GetxController {
  //userDetails
  var subconid = "".obs;
  var userid = "".obs;
  var roleid = 0.obs;
  var username = "".obs;

//urls
  var baseurl = "http://129.154.47.8:8083/api/".obs;
  var inventoryurl = "".obs;
  var stackurl = "".obs;
  var stackAbrovalurl = "".obs;
  var blastingurl = "".obs;

//datalists
  var materialList = [].obs;
  var inventoryList = [].obs;
  var uomList = [].obs;
  var subcontractorList = [].obs;
  var supportclaseList =[].obs;
  var excavation =[].obs;

//temp variables
  var bfromDate = "".obs;
  var btoDate = "".obs;
  var strfromDate = "".obs;
  var strtoDate = "".obs;
  var sArfromDate = "".obs;
  var sArtoDate = "".obs;
  var getonetimedata = 0;

//blastr request list
  List addBlastingRequest = [].obs;
  var blastingRequestdetailslist = [].obs;
  var stockRequestdetailslist = [].obs;

//siteincharge:
  var inventorySubId = "".obs;

  @override
  void onInit() {
    getmaterialData();
    getUomData();
    getSubcontractordata();
    getIventoryData();
    getblastingRequestdetailslist();
    getStockRequestdetailslist();
    if (getonetimedata == 0) {
      bRsetDate("", "");sRsetDate("", "");sAsetDate("", "");
      getonetimedata++;
      stackurl.value = '${baseurl}stockTransferRequestHeader/all';
      blastingurl.value = '${baseurl}blastingRequestHeader/all';
      inventoryurl.value = "${baseurl}stock/all";
    }
    super.onInit();
  }

  bRsetDate(var from, var to) {
    if (bfromDate.value == from && btoDate.value == to) {
      var formatter = DateFormat('dd-MM-yyyy');
      var now = DateTime.now();
      bfromDate.value = formatter.format(now).toString();
      btoDate.value = formatter.format(now).toString();
    } else {
      bfromDate.value = from.toString();
      btoDate.value = to.toString();
     blastingurl.value =
          '${baseurl}blastingRequestHeader/findbydate/${dategetYMD(bfromDate.toString())}/${dategetYMD(btoDate.toString())}/all';
    }
  }

  sRsetDate(var from, var to) {
    if (strfromDate.value == from && strtoDate.value == to) {
      var formatter = DateFormat('dd-MM-yyyy');
      var now = DateTime.now();
      strfromDate.value = formatter.format(now).toString();
      strtoDate.value = formatter.format(now).toString();
    } else {
      strfromDate.value = from.toString();
      strtoDate.value = to.toString();
      stackurl.value =
          '${baseurl}stockTransferRequestHeader/findbydate/${strfromDate.toString()}/${strtoDate.toString()}/all';
    }
  }
  
  sAsetDate(var from, var to) {
    if (sArfromDate.value == from && sArtoDate.value == to) {
      var formatter = DateFormat('dd-MM-yyyy');
      var now = DateTime.now();
      sArfromDate.value = formatter.format(now).toString();
      sArtoDate.value = formatter.format(now).toString();
    } else {
      sArfromDate.value = from.toString();
      sArtoDate.value = to.toString();
      stackAbrovalurl.value =
          '${baseurl}stockTransferRequestHeader/findbydate/${sArfromDate.toString()}/${sArtoDate.toString()}/all';
     }
  }

  updateUser(var id, var subid, var role, var name) {
    userid.value = id.toString();
    subconid.value = subid.toString();
    roleid.value = role;
    username.value = name;
  }

  getIventoryData() async {
    try {
      var response = await Dio().get('${baseurl}stock/all');
      var data = response.data;
      inventoryList.value = data;
    } catch (e) {
      print(e);
    }
  }

  getmaterialData() async {
    try {
      var response = await Dio().get('${baseurl}material/all');
      var data = response.data;
      materialList.value = data;
    } catch (e) {
      print(e);
    }
  }

  getUomData() async {
    try {
      var response = await Dio().get('${baseurl}uom/all');
      var data = response.data;
      uomList.value = data;
    } catch (e) {
      print(e);
    }
  }

  getSubcontractordata() async {
    try {
      var response = await Dio().get('${baseurl}subContractor/all');
      var data = response.data;
      subcontractorList.value = data;
    } catch (e) {
      // print(e);
    }
  }

  getblastingRequestdetailslist() async {
    try {
      var response = await Dio().get('${baseurl}blastingRequest/all');
      var data = response.data;
      blastingRequestdetailslist.value = data;
    } catch (e) {
      // print(e);
    }
  }

  getStockRequestdetailslist() async {
    try {
      var response =
          await Dio().get('${baseurl}stockTransferRequestDetails/all');
      var data = response.data;
      stockRequestdetailslist.value = data;
    } catch (e) {
      // print(e);
    }
  }

  fetchBlasteRqsDetailstData() async {
    try {
      var response = await Dio().get('${baseurl}blastingRequest/all');
      var data = response.data;
      subcontractorList.value = data;
    } catch (e) {
      // print(e);
    }
  }
}
