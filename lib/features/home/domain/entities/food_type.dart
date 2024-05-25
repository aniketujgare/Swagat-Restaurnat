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

// Mapping of string to FoodType enum
final Map<String, FoodCategory> foodTypeJson = {
  'Veg Bhaji': FoodCategory.vegBhaji,
  'Non Veg Bhaji': FoodCategory.nonVegBhaji,
  'Roti': FoodCategory.roti,
  'Rice': FoodCategory.rice,
  'Veg Starter': FoodCategory.vegStarter,
  'Veg Thali': FoodCategory.vegThali,
  'Veg Biryani': FoodCategory.vegBiryani,
  'Papad': FoodCategory.papad,
  'Special Vidarbha': FoodCategory.specialVidarbha,
};
