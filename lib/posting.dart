import 'package:blaster/app/view/widgets/errormsgbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'controller.dart';
import 'extensions.dart';

final Controller c = Get.put(Controller());

Future addQty(BuildContext context, var id, var qty) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}stock/$id/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "stockId":id,
      'updatedQty': int.parse(qty)
    }),
  );

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    Navigator.pop(context);
    return result;
  } else {
    errormsgbox(context, "Request Failed\nerror code : ${response.statusCode}");
  }
}

Future approvedQty(
  BuildContext context,
  materialId,
  var stockid,
  var qty,
) async {
  var qtytype = getQtytypebymtlID(materialId);
  final response = await http.put(
    Uri.parse('${c.baseurl}stock/$stockid/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "stockId":stockid,
      qtytype.toString(): int.parse(qty),
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    Navigator.pop(context);
    return result;
  } else {
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}

// Blaster --> Blast Request Header Update

Future BlBrHeaderUpdate(
  BuildContext context,
  var date,var shift, var tfaceid
  ) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}blastingRequestHeader/add'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "date": "2022-10-26T00:00:00.000+00:00",
      "shift": "Day",
      "tunnelFaceId": 1,
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    return result;
  } else {
    // ignore: use_build_context_synchronously
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}

// --> Blast Request Details Update

Future BlBrDetailsUpdate(
  BuildContext context,
  var material, var requested 
  ) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}blastingRequest/all'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "stockId": 187,
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    return result;
  } else {
    // ignore: use_build_context_synchronously
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}

// Blaster --> Stock Transfer Request Header Update

Future BlSTRHeaderUpdate(
  BuildContext context,
  var date, var remarks
  ) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}stockTransferRequestHeader/add'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "date": "2022-11-14T00:00:00.000+00:00",
      "remarks": "pppp",
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    return result;
  } else {
    // ignore: use_build_context_synchronously
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}

// Blaster --> Stock Transfer Request Details Update

Future BlSTRDetailsUpdate(
  BuildContext context,
  var materialid, var requestedQty
  ) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}stockTransferRequestDetails/add'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "materialId": 63,
      "qty": 100,
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    return result;
  } else {
    // ignore: use_build_context_synchronously
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}


// Sub Contractor --> Blast Request Header Update

Future SCBrHeaderUpdate(
  BuildContext context,
  var date,var shift, var tfaceid, var chainageFrom,var chinageTo, var supportClassId, var excavationMethod
  ) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}blastingRequestHeader/add'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "date": "2022-10-26T00:00:00.000+00:00",
      "shift": "Day",
      "tunnelFaceId": 1,
      "chainageFrom": 0.0,
      "chainageTo": 0.0,
      "supportClassId": 0,
      "excavationMethodId": 0,
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    return result;
  } else {
    // ignore: use_build_context_synchronously
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}

// Sub Contractor --> Blast Request Details Update

Future SCBrDetailsUpdate(
  BuildContext context,
  var material,
  ) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}blastingRequest/add'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{

    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    return result;
  } else {
    // ignore: use_build_context_synchronously
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}

// Sub Contractor --> Stock Transfer Request Header Update

Future SCSTRHeaderUpdate(
  BuildContext context,
  var date, var remarks,var fromSubCon
  ) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}stockTransferRequestHeader/add'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "date": "2022-11-14T00:00:00.000+00:00",
      "remarks": "pppp",
      "fromSubConId": 4,
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    return result;
  } else {
    // ignore: use_build_context_synchronously
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}

// Sub Contractor --> Stock Transfer Request Header Update

Future SCSTRDetailsUpdate(
  BuildContext context,
  var ApprovedQty
  ) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}stockTransferRequestDetails/add'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "approvedQty": 50,
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    return result;
  } else {
    // ignore: use_build_context_synchronously
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}
