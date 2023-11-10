import 'package:works_app/src/features/types_pets/domain/entities/pets_entity.dart';

class PetsModel extends PetsEntity {
  PetsModel({
    super.id,
    super.url,
    super.width,
    super.height,
    super.type,
  });

  factory PetsModel.fromJson(Map<String, dynamic> json) => PetsModel(
    id : json['id'] ?? '',
    url : json['url'] ?? '',
    width : json['width'] ?? '',
    height : json['height'] ?? '',
  );

}
