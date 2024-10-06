// class Medicine {
//   final int _id;
//   final String _type;
//   final String _scientific_name;
//   final String _trade_name;
//   final int _price;
//   final int _quantity;
//   final String _manufacturer_id;
//   final String _expires_at;
//   final String _expires_at_human;
//   final Map<String, dynamic> _manufacturer;
//
//   Medicine({
//     required int id,
//     required String type,
//     required String scientific_name,
//     required String trade_name,
//     required int price,
//     required int quantity,
//     required String manufacturer_id,
//     required String expires_at,
//     required String expires_at_human,
//     required Map<String, dynamic> manufacturer,
//   })  : _id = id,
//         _type = type,
//         _scientific_name = scientific_name,
//         _trade_name = trade_name,
//         _price = price,
//         _quantity = quantity,
//         _manufacturer_id = manufacturer_id,
//         _expires_at = expires_at,
//         _expires_at_human = expires_at_human,
//         _manufacturer = manufacturer;
//
//   int get id => _id;
//   String get type => _type;
//   String get scientific_name => _scientific_name;
//   String get trade_name => _trade_name;
//   int get price => _price;
//   int get quantity => _quantity;
//   String get manufacturer_id => _manufacturer_id;
//   String get expires_at => _expires_at;
//   String get expires_at_human => _expires_at_human;
//   Map<String, dynamic> get manufacturer => _manufacturer;
// }

class Medicine {
  final int id;
  final String type;
  final String scientific_name;
  final String trade_name;
  final double price;
  final int quantity;
  final String photo_url;
  final int manufacturer_id;
  final String expires_at;
  final String expires_at_human;
  final Map manufacturer;

  Medicine({
    required this.id,
    required this.type,
    required this.scientific_name,
    required this.trade_name,
    required this.price,
    required this.quantity,
    required this.photo_url,
    required this.manufacturer_id,
    required this.expires_at,
    required this.expires_at_human,
    required this.manufacturer,
  });
}
