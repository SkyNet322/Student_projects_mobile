class Calculate{
  TsoCAPEX? tsoCAPEX;
  TsoOPEX? tsoOPEX;
  List<Inflic>? inflic;
  Development? development;
  Support? support;

  Calculate({ this.tsoCAPEX, this.tsoOPEX, this.inflic, this.development, this.support});
  factory Calculate.fromJson(Map<dynamic, dynamic> json) {
    var list = json['inflic'] as List;
    List<Inflic> inflicList = list.map((i) => Inflic.fromJson(i)).toList();
    return Calculate(
      tsoCAPEX: TsoCAPEX.fromJson(json['tsoCAPEX']),
      tsoOPEX: TsoOPEX.fromJson(json['tsoOPEX']),
      inflic: inflicList,
      development: Development.fromJson(json['development']),
      support: Support.fromJson(json['support']),
    );
  }
}

class TsoCAPEX{
 var year1;
 var year2;
 var year3;
 var year4;
 var year5;
 var total;

 TsoCAPEX({this.year1, this.year2,this.year3,this.year4,this.year5, this.total});
 factory TsoCAPEX.fromJson(Map<dynamic, dynamic> json) {
   return TsoCAPEX(
     year1: json["1year"],
     year2: json["2year"],
     year3: json["3year"],
     year4: json["4year"],
     year5: json["5year"],
     total: json["total"]
   );
 }
}

class TsoOPEX{
  var year1;
  var year2;
  var year3;
  var year4;
  var year5;
  var total;

  TsoOPEX({this.year1, this.year2,this.year3,this.year4,this.year5, this.total});

  factory TsoOPEX.fromJson(Map<dynamic, dynamic> json) {
    return TsoOPEX(
        year1: json["1year"],
        year2: json["2year"],
        year3: json["3year"],
        year4: json["4year"],
        year5: json["5year"],
        total: json["total"]
    );
  }
}

class Inflic{
  var item;
  var type;
  var year1;
  var year2;
  var year3;
  var year4;
  var year5;
  var total;

  Inflic({this.item, this.type, this.year1, this.year2, this.year3, this.year4, this.year5, this.total});
  factory Inflic.fromJson(Map<dynamic, dynamic> json) {
    return Inflic(
        item: json["item"],
        type: json["type"],
        year1: json["1year"],
        year2: json["2year"],
        year3: json["3year"],
        year4: json["4year"],
        year5: json["5year"],
        total: json["total"]
    );
  }
}

class Development{
  var year1;
  var year2;
  var year3;
  var year4;
  var year5;
  var total;

  Development({this.year1, this.year2,this.year3,this.year4,this.year5, this.total});
  factory Development.fromJson(Map<dynamic, dynamic> json) {
    return Development(
        year1: json["1year"],
        year2: json["2year"],
        year3: json["3year"],
        year4: json["4year"],
        year5: json["5year"],
        total: json["total"]
    );
  }
}

class Support{
  var year1;
  var year2;
  var year3;
  var year4;
  var year5;
  var total;

  Support({this.year1, this.year2,this.year3,this.year4,this.year5, this.total});
  factory Support.fromJson(Map<dynamic, dynamic> json) {
    return Support(
        year1: json["1year"],
        year2: json["2year"],
        year3: json["3year"],
        year4: json["4year"],
        year5: json["5year"],
        total: json["total"]
    );
  }
}
