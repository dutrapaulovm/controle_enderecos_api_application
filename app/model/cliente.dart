// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Cliente {
  String? nome;
  String? cpf;
  String? email;

  Cliente({
    this.nome,
    this.cpf,
    this.email,
  });

  Cliente copyWith({
    String? nome,
    String? cpf,
    String? email,
  }) {
    return Cliente(
      nome: nome ?? this.nome,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'cpf': cpf,
      'email': email,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      nome: map['nome'] != null ? map['nome'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) =>
      Cliente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cliente(nome: $nome, cpf: $cpf, email: $email)';

  @override
  bool operator ==(covariant Cliente other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.cpf == cpf && other.email == email;
  }

  @override
  int get hashCode => nome.hashCode ^ cpf.hashCode ^ email.hashCode;
}
