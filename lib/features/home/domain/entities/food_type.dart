import 'package:json_annotation/json_annotation.dart';

enum FoodCategory {
  @JsonValue('veg_bhaji')
  vegBhaji,
  @JsonValue('non_veg_bhaji')
  nonVegBhaji,
  @JsonValue('roti')
  roti,
  @JsonValue('rice')
  rice,
  @JsonValue('veg_starter')
  vegStarter,
  @JsonValue('veg_thali')
  vegThali,
  @JsonValue('veg_biryani')
  vegBiryani,
  @JsonValue('papad')
  papad,
  @JsonValue('special_vidarbha')
  specialVidarbha
}
