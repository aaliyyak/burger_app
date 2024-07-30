class Product {
  final String nama;
  final String imageUrl;
  final String harga;
  final String detail;
  final String komposisi;
  int quantity;

  Product({
    required this.nama,
    required this.imageUrl,
    required this.harga,
    required this.detail,
    required this.komposisi,
    this.quantity = 1,
  });

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
