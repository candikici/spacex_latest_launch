class Patch {
  String small;
  String large;
  Patch({
    required this.small,
    required this.large,
  });

  factory Patch.fromMap(Map<String, dynamic> map) {
    return Patch(
      small: map['small'] ?? '',
      large: map['large'] ?? '',
    );
  }

  @override
  String toString() => 'Patch(small: $small, large: $large)';
}
