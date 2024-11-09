import 'dart:io';

//global products map
Map<String, dynamic> productsMap = Map();

void manager() {
  print("manager panel");

  bool status = true;
  String? productName;
  int? qty, price;
  int? choice;

  while (status) {
    Map<String, dynamic> specificMap = Map();
    print("Enter product name: ");
    productName = stdin.readLineSync();

    print("Enter qty: ");
    qty = int.parse(stdin.readLineSync()!);

    print("Enter price: ");
    price = int.parse(stdin.readLineSync()!);

    if (productsMap.containsKey(productName)) {
      specificMap["qty"] = productsMap[productName]["qty"] + qty;
      specificMap["price"] = price;

      productsMap[productName!] = specificMap;
    } else {
      specificMap["qty"] = qty;
      specificMap["price"] = price;

      productsMap[productName!] = specificMap;
    }

    print(productsMap);

    print("Do you want to add more products press 1 for yes and 2 for no: ");
    choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      status = true;
    } else {
      status = false;
    }
  }
}

void customer() {
  String choice;
  String? productname;
  int? purchaseqty;
  bool status = true;
  num totalprice;
  String? select;
  print("customer panel");

  print("Products: ");
  productsMap.forEach((key, value) {
    print("$key: \tRs.${value['price']}");
  });

  while (status) {
    print("Do you want to oder Products press y for yes and n for no");
    choice = stdin.readLineSync()!;

    if (choice.toLowerCase() == 'y') {
      print("Enter Which Product you want to buy  : ");
      productname = stdin.readLineSync()!;

      print("no of qty you want: ");
      purchaseqty = int.parse(stdin.readLineSync()!);

      if (productsMap.containsKey(productname)) {
        productsMap[productname]['qty'] -= purchaseqty;

        print("Do yo want to prosess press y");
        select = stdin.readLineSync()!;
        if (select.toLowerCase() == 'y') {
          totalprice = purchaseqty * productsMap[productname]['price'];
          print(
              "Total price: qty $purchaseqty X Rs.${productsMap[productname]['price']}=RS.$totalprice");
        } else {
          print("Cansaling Order");
        }
      } else {
        print("Product not found.");
      }
    } else {
      status = false;
    }
  }
}

void main() {
  int? choice;
  bool status = true;
  int select;

  while (status) {
    print("                Menu               ");
    print("\n press 1 for product manager ");
    print("\n press 2 for customer ");

    print("Enter your choice: ");
    choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      manager();
    } else {
      customer();
    }

    print("Do you want to go home menu press 1 for yes and 2 for no: ");
    select = int.parse(stdin.readLineSync()!);

    if (select == 1) {
      status = true;
    } else {
      status = false;
    }
  }
}
