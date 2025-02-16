import 'package:uuid/uuid.dart';
import 'package:polyapp/models/enums/role_type.dart';

enum RoleType {
  ADMIN,
  USER,
  ADMIN_FOOTBALL,
  ADMIN_BASKET,
  ADMIN_VOLLEY,
  ADMIN_JEUX_ESPRIT
}

class Role {
  final RoleType nom;

  Role({
    required this.nom,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      nom: RoleType.values
          .firstWhere((e) => e.toString() == 'RoleType.${json['nom']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom.toString().split('.').last,
    };
  }
}
