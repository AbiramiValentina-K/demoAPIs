import 'package:get/get.dart';

import 'controller.dart';

final Controller c = Get.put(Controller());

String capitalize(String value) => value[0].toUpperCase() + value.substring(1);


String shiftget(String value) => value[0].toUpperCase();

String statusget(String value) =>
    value == "null" ? "---" : value[0].toUpperCase() + value.substring(1);

dategetDMY(String value) {
  var value1 = value.split("T")[0];
  var value2 = value1.split("-");
  var result = "${value2[2]}-${value2[1]}-${value2[0]}";
  return result;
}

dategetYMD(String value) {
  var value2 = value.split("-");
  var result = "${value2[2]}-${value2[1]}-${value2[0]}";
  return result;
}

getmaterialname(var value) {
  var result;
  for (var data in c.materialList) {
    if (data["materialId"] == value) {
      result = data["materialDescription"];
    }
  }
  return result;
}

getUnitbyID(var value) {
  c.onInit();
  var result;
  for (var data in c.materialList) {
    if (data["materialId"] == value) {
      for (var data2 in c.uomList) {
        if (data2["uomId"] == data["uomId"]) {
          result = data2["singularName"];
        }
      }
    }
  }
  return result;
}

getQtybyID(var value) {
  var result;
  for (var data in c.inventoryList) {
    if (data["materialId"] == value) {
      if (data["consumeType"] == "C") {
        result = data["qty"];
      } else {
        result = data["nonConsumableQty"];
      }
    }
  }

  return result;
}

getQtytypebymtlID(var value) {
  var result;
  for (var data in c.inventoryList) {
    if (data["materialId"] == value) {
      if (data["consumeType"] == "C") {
        result ="qty";
      } else {
        result ="nonConsumableQty";
      }
    }else{
       result ="qty";
    }
  }

  return result;
}

getSubcontractorName(var value) {
  // ignore: prefer_typing_uninitialized_variables
  var result;
  if (value == 0) {
    result = "---";
  } else {
    for (var data in c.subcontractorList) {
      if (data["subConId"] == value) {
        if (data["subConName"] != null) {
          result = data["subConName"];
        } else {
          result = "---";
        }
      }
    }
  }

  return result;
}

List getDropdownLite() {
  var result = [];
  for (var data in c.inventoryList) {
    if (data["subConId"].toString() == c.subconid.toString()) {
      result.add(data);
    }
  }
  return result;
}

getRoleName(var value) {
  // ignore: prefer_typing_uninitialized_variables
  var result;
  if (value.toString() == "1") {
    result = "Subcontractor";
  } else if (value.toString() == "2") {
    result = "Blaster";
  } else if (value.toString() == "3") {
    result = "Siteincharge";
  }

  return result;
}
