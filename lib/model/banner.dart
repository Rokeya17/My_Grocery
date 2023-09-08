import 'dart:convert';

import 'package:hive/hive.dart';

part 'banner1.dart';

List<Banner> adBannerListFromJson(String val) => List<Banner>.from(
    json.decode(val)['data'].map((banner) => Banner.fromJson(banner)));

@HiveType(typeId: 1)
class Banner {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;

  Banner({required this.id, required this.image});

  factory Banner.fromJson(Map<String, dynamic> data) => Banner(
      id: data['id'],
      image: data['attributes']['image']['data']['attributes']['url']);
}
