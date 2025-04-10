class ProductRating {
  final double rate;
  final int count;

  ProductRating({required this.rate, required this.count});

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
