
class Designation {
  Designation({
      this.abbreviated, 
      this.expanded,});

  Designation.fromJson(dynamic json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }
  String? abbreviated;
  String? expanded;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['abbreviated'] = abbreviated;
    map['expanded'] = expanded;
    return map;
  }

}