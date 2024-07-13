import 'dart:convert';

class ActivityModel {
  final String date;
  final String name;
  final String category;
  final String location;
  ActivityModel({
    required this.date,
    required this.name,
    required this.category,
    required this.location,
  });

  ActivityModel copyWith({
    String? date,
    String? name,
    String? category,
    String? location,
  }) {
    return ActivityModel(
      date: date ?? this.date,
      name: name ?? this.name,
      category: category ?? this.category,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'name': name,
      'category': category,
      'location': location,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      date: map['date'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(String source) =>
      ActivityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActivityModel(date: $date, name: $name, category: $category, location: $location)';
  }

  @override
  bool operator ==(covariant ActivityModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.name == name &&
        other.category == category &&
        other.location == location;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        name.hashCode ^
        category.hashCode ^
        location.hashCode;
  }
}
