import 'package:equatable/equatable.dart';

class DescriptionPetsEntity extends Equatable {
  final String? id;
  final String? url;
  final List<BreedsEntity>? breeds;
  final int? width;
  final int? height;

  const DescriptionPetsEntity({
    this.id,
    this.url,
    this.breeds,
    this.width,
    this.height,
  });

  @override
  List<Object?> get props => [id, url, breeds, width, height];
}

class BreedsEntity extends Equatable {
  final Weight? weight;
  final Height? height;
  final int? id;
  final String? name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? referenceImageId;

  const BreedsEntity({
    this.weight,
    this.height,
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.referenceImageId,
  });

  @override
  List<Object?> get props => [
        weight,
        height,
        id,
        name,
        bredFor,
        breedGroup,
        lifeSpan,
        temperament,
        referenceImageId,
        height,
      ];
}

class Weight {
  Weight({
    required this.imperial,
    required this.metric,
  });

  late final String imperial;
  late final String metric;

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imperial'] = imperial;
    _data['metric'] = metric;
    return _data;
  }
}

class Height {
  Height({
    required this.imperial,
    required this.metric,
  });

  late final String imperial;
  late final String metric;

  Height.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imperial'] = imperial;
    _data['metric'] = metric;
    return _data;
  }
}
