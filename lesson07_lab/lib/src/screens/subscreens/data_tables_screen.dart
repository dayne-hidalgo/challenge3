import 'package:flutter/material.dart';
class DataTablesScreen extends StatefulWidget {
  @override
  _DataTablesScreenState createState() => _DataTablesScreenState();
}

class _DataTablesScreenState extends State<DataTablesScreen> {
  int numColumnas = 4;
  int numFilas = 20;
  
  // Asumiendo que tienes una clase Producto para gestionar los datos
  List<Producto> products = List.generate(20, (index) => Producto(index, "Producto $index", 10, 54.20));
  bool sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de Productos'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            sortAscending: sortAscending,
            sortColumnIndex: 1, // Columna de "Producto"
            columns: addHeaders(),
            rows: addRows(),
          ),
        ),
      ),
    );
  }

  List<DataColumn> addHeaders() {
    return [
      DataColumn(label: Text("Nro")),
      DataColumn(
        label: Text("Producto"),
        onSort: (columnIndex, ascending) {
          setState(() {
            if (ascending) {
              products.sort((a, b) => a.name.compareTo(b.name));
            } else {
              products.sort((a, b) => b.name.compareTo(a.name));
            }
            sortAscending = ascending;
          });
        },
      ),
      DataColumn(label: Text("Cantidad")),
      DataColumn(label: Text("Precio")),
    ];
  }

  List<DataRow> addRows() {
    return products.map((producto) {
      return DataRow(
        cells: [
          DataCell(Text(producto.id.toString())),
          DataCell(Text(producto.name)),
          DataCell(Text(producto.quantity.toString())),
          DataCell(Text(producto.price.toString())),
        ],
      );
    }).toList();
  }
}

class Producto {
  final int id;
  final String name;
  final int quantity;
  final double price;

  Producto(this.id, this.name, this.quantity, this.price);
}
