import 'package:equatable/equatable.dart';

class PetsEntity extends Equatable{

  final String? id;
  final String? url;
  final int? width;
  final int? height;
  late String? type;

  PetsEntity({
    this.id,
    this.url,
    this.width,
    this.height,
    this.type,
  });

  @override
  List<Object?> get props => [id, url, width, height, type];
}
