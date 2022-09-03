class Invite {
  late String nom;
  late String numero;
  //
  Map<String, dynamic> toJson() => {
        'nom': nom,
        'numero': numero,
      };
}
