import 'package:works_app/src/features/description_pets/domain/entities/description_pets_entity.dart';

class DescriptionPetsModel extends DescriptionPetsEntity{
  const DescriptionPetsModel({
    super.id,
    super.url,
    super.breeds,
    super.width,
    super.height,
  });

  factory DescriptionPetsModel.fromJson(Map<String, dynamic> json) => DescriptionPetsModel(
    id: json['id'],
    url: json['url'],
    breeds: json['breeds'] != null ? List.from(json['breeds']).map((e) => BreedsModel.fromJson(e)).toList() : null,
    width: json['width'],
    height: json['height'],
  );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['url'] = url;
    _data['width'] = width;
    _data['height'] = height;
    return _data;
  }
}

class BreedsModel extends BreedsEntity{
  const BreedsModel({
    super.weight,
    super.height,
    super.id,
    super.name,
    super.bredFor,
    super.breedGroup,
    super.lifeSpan,
    super.temperament,
    super.referenceImageId,
  });

  factory BreedsModel.fromJson(Map<String, dynamic> json) => BreedsModel(
    weight: Weight.fromJson(json['weight']),
    height: Height.fromJson(json['height']),
    id: json['id'],
    name: json['name'],
    bredFor: json['bred_for'],
    breedGroup: json['breed_group'],
    lifeSpan: json['life_span'],
    temperament: json['temperament'],
    referenceImageId: json['reference_image_id'],
  );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['bred_for'] = bredFor;
    _data['breed_group'] = breedGroup;
    _data['life_span'] = lifeSpan;
    _data['temperament'] = temperament;
    _data['reference_image_id'] = referenceImageId;
    return _data;
  }
}