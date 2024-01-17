// items.dart

class Item {
  final String jenis;
  final int nomor;

  Item({
    required this.jenis,
    required this.nomor,
  });
}

List<Item> items = [
  Item(jenis: 'E-Wallet', nomor: 6285798769325),
  Item(jenis: 'Kartu debit', nomor: 8823887251429852),
];
