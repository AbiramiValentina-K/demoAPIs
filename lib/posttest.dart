import 'package:http/http.dart' as http;
import 'dart:convert';

Future stockTRHeader(var userid,var subconid,var remark) async {
  final response = await http.post(
    Uri.parse('http://129.154.47.8:8083/api/stockTransferRequestHeader/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
       "stockTransferRequestHeaderId": 42,
    "orderId": "0044",
    "date": "2022-11-14T00:00:00.000+00:00",
    "approvedBy": 0,
    "userId": userid,
    "subConId": subconid,
    "fromSubConId": 0,
    "remarks": remark,
    "status": "Received",
    "createdDate": null,
    "modifiedBy": "146",
    "modifiedDate": null
    }),
  );

  if (response.statusCode == 201) {
    
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to create album.');
  }
}
