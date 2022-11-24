class Stockmodel {
  Stockmodel({
    required this.stockId,
    required this.subConId,
    required this.materialId,
    required this.qty,
    required this.nonConsumableQty,
    required this.consumeType,
    required this.updatedQty,
    required this.unapprovedQtyit,
    required this.status,
    required this.remarks,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
  });
  // ignore: prefer_typing_uninitialized_variables
  var stockId;
  var subConId;
  var materialId;
  var qty;
  var nonConsumableQty;
  var consumeType;
  var updatedQty;
  var unapprovedQtyit;
  var status;
  var remarks;
  var createdDate;
  var modifiedBy;
  var modifiedDate;

  factory Stockmodel.fromJson(Map<String, dynamic> json) {
    return Stockmodel(
      stockId: ["stockId"],
      subConId: ["subConId"],
      materialId: ["materialId"],
      qty: ["qty"],
      nonConsumableQty: ["nonConsumableQty"],
      consumeType: ["consumeType"],
      updatedQty: ["updatedQty"],
      unapprovedQtyit: ["unapprovedQtyit"],
      status: ["status"],
      remarks: ["remarks"],
      createdDate: ["createdDate"],
      modifiedBy: ["modifiedBy"],
      modifiedDate: ["modifiedBy"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      stockId: ["stockId"],
      subConId: ["subConId"],
      materialId: ["materialId"],
      qty: ["qty"],
      nonConsumableQty: ["nonConsumableQty"],
      consumeType: ["consumeType"],
      updatedQty: ["updatedQty"],
      unapprovedQtyit: ["unapprovedQtyit"],
      status: ["status"],
      remarks: ["remarks"],
      createdDate: ["createdDate"],
      modifiedBy: ["modifiedBy"],
      modifiedDate: ["modifiedBy"],
    };
  }

  map(Null Function(dynamic e) param0) {}
}

class BlateRequest {
  BlateRequest(
      {required this.date,
      required this.shift,
      required this.tunnelID,
      required this.materialId,
      required this.addQty});

  var shift;
  var date;
  var tunnelID;
  var materialId;
  var addQty;
}


