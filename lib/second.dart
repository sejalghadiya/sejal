import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import 'last.dart';


class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  List<InvoiceItem> invoiceItems = [];

  double _subtotal = 0;
  double _taxRate = 0.1; // 10% tax rate, change this according to your needs
  double _total = 0;

  double _calculateTotal() {
    double total = 0;
    invoiceItems.forEach((item) {
      total += item.quantity * item.price;
    });
    return total;
  }
  double _calculateSubtotal() {
    double subtotal = 0;
    invoiceItems.forEach((item) {
      subtotal += item.quantity * item.price;
    });
    return subtotal;
  }

  void _updateTotals() {
    double subtotal = _calculateSubtotal();
    double taxAmount = subtotal * _taxRate;
    double total = subtotal + taxAmount;

    setState(() {
      _subtotal = subtotal;
      _total = total;
    });
  }


  void _addItem() {
    String itemName = _itemNameController.text;
    double quantity = double.parse(_quantityController.text);
    double price = double.parse(_priceController.text);

    setState(() {
      invoiceItems.add(InvoiceItem(itemName, quantity, price));
      _itemNameController.clear();
      _quantityController.clear();
      _priceController.clear();
      _updateTotals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(margin: EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _itemNameController, decoration: InputDecoration(labelText: 'Item Name')),
            TextField(controller: _quantityController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Quantity')),
            TextField(controller: _priceController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Price')),
            ElevatedButton(onPressed: () {
              _addItem();
              print(invoiceItems);
            }, child: Text('Add Item')),
            SizedBox(height: 10),
            Text('Invoice Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: invoiceItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(invoiceItems[index].itemName),
                    subtitle: Text('Quantity: ${invoiceItems[index].quantity}, Price: \$${invoiceItems[index].price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: ()  {
            generatePdf(invoiceItems, _taxRate, _subtotal, _total);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenB(invoiceItems: invoiceItems, taxRate: _taxRate, subtotal: _subtotal, total: _total, Total: _total)));
          }
      ),
    );
  }
  Future<Uint8List> generatePdf(List<InvoiceItem> invoiceItems, double taxRate, double subtotal, double total) async {
    final fontData = await rootBundle.load("lib/assets/font/Montserrat-VariableFont_wght.ttf");
    final ttf = pw.Font.ttf(fontData);
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a3,
        build: (pw.Context context){
          return pw.Column(
            children: [
              pw.Text("Invoice", style: pw.TextStyle(fontSize: 40,font: ttf,fontWeight: pw.FontWeight.bold,color: PdfColors.black)),
              pw.Divider(thickness: 0.3, color: PdfColors.black),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 400),
                child: pw.Text("Invoic No:  INV-234543", style: pw.TextStyle(fontSize: 17,color: PdfColors.black,fontWeight: pw.FontWeight.bold),),
              ),
              pw.SizedBox(height: 5),
              pw.Padding(
                padding: pw.EdgeInsets.only(left: 400),
                child:   pw.Text("Invoice Date: 101/08/2023", style: pw.TextStyle(fontSize: 17,color: PdfColors.black)),
              ),
              pw.SizedBox(height: 20),
              pw.Padding(
                padding: pw.EdgeInsets.only(right: 550),
                child:  pw.Text("Bill To",style: pw.TextStyle( fontSize: 20,fontWeight: pw.FontWeight.bold,color: PdfColors.black),),
              ),
              pw.SizedBox(height: 8),
              pw.Padding(
                padding: pw.EdgeInsets.only(right: 400),
                child:  pw.Text("Target Comapny Inc\nUnit 999,Lingkaran Syed Putra\nMid Valley City\nWilayah Persekutuan Kuala Lumpur\nTel: 03-9876-1234",
                style: pw.TextStyle(fontSize: 17,color: PdfColors.black)),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                columnWidths: { 0: pw.FlexColumnWidth(1), 1: pw.FlexColumnWidth(4), 2:pw.FlexColumnWidth(1.7), 3:pw.FlexColumnWidth(2.4)},
                border: pw.TableBorder(
                  top: pw.BorderSide(
                      color: PdfColors.black,width: 2
                  ),
                  bottom:  pw.BorderSide(
                      color: PdfColors.black,width: 2
                  ),
                  right:  pw.BorderSide(
                      color: PdfColors.black,width: 2
                  ),
                  left:  pw.BorderSide(
                      color: PdfColors.black,width: 2
                  ),
                  horizontalInside: pw.BorderSide(color: PdfColors.black,width: 1),
                  verticalInside: pw.BorderSide(color: PdfColors.black,width: 1),
                ),
                children: [
                  pw.TableRow(
                      decoration: pw.BoxDecoration(
                          color: PdfColors.grey
                      ),
                      children: [
                        pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Center(
                              child: pw.Text('No',style: pw.TextStyle(fontSize: 15)),
                            )
                        ),
                        pw.Padding(
                            padding:pw.EdgeInsets.all(10),
                            child: pw.Center(
                              child: pw.Text('Item',style: pw.TextStyle(fontSize: 15)),
                            )
                        ),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Center(
                              child: pw.Text('Quntity',style: pw.TextStyle(fontSize: 15)),
                            )
                        ),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Center(
                              child: pw.Text('Price',style: pw.TextStyle(fontSize: 15)),
                            )
                        ),
                      ]
                  ),
                  for(int i=0; i<invoiceItems.length; i++)...[
                    pw.TableRow(
                      children:[
                        pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Center(
                              child: pw.Text('${i+1}'),
                            )
                        ),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Text("${invoiceItems[i].itemName}",style: pw.TextStyle(fontSize: 15))
                        ),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Center(
                              child: pw.Text("${invoiceItems[i].quantity}",style: pw.TextStyle(fontSize: 15)),
                            )
                        ),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(10),
                            child: pw.Center(
                              child: pw.Text("${invoiceItems[i].price}",style: pw.TextStyle(fontSize: 15)),
                            )
                        ),
                      ]
                    ),
                  ]
                ]
              ),
              pw.Table(
                columnWidths: {0: pw.FlexColumnWidth(6.7), 1: pw.FlexColumnWidth(2.4)},
                border: pw.TableBorder(
                  bottom: pw.BorderSide(
                    color: PdfColors.black,width: 2
                  ),
                  right: pw.BorderSide(
                    color: PdfColors.black,width: 2
                  ),
                  left: pw.BorderSide(
                    color: PdfColors.black,width: 2
                  ),
                  horizontalInside: pw.BorderSide(color: PdfColors.black,width: 1),
                  verticalInside: pw.BorderSide(color: PdfColors.black,width: 1),
                ),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Text(
                          'Total',style: pw.TextStyle(fontSize: 15)
                        )
                      ),
                      pw.Padding(padding: pw.EdgeInsets.all(10),
                        child: pw.Center(
                          child: pw.Text('${_total}',style: pw.TextStyle(fontSize: 13)),
                        )
                      ),
                    ]
                  )
                ]
              ),
              pw.SizedBox(height: 20),
              pw.Padding(padding: pw.EdgeInsets.only(right: 550),
              child:   pw.Text('Issued by\nxyz....', style: pw.TextStyle(fontSize: 15,color: PdfColors.black,fontWeight: pw.FontWeight.bold)),
              ),
              pw.SizedBox(height: 5),
              pw.Padding(padding: pw.EdgeInsets.only(right: 550),
                child:  pw.Text('abc123@gmail.com', style: pw.TextStyle(fontSize: 15,color: PdfColors.black)),
              ),
              pw.SizedBox(height: 300),
              pw.Container(
                height: 20,width: 90,
                child: pw.Text("The tax invoice is computer generated and no signature is required",style: pw.TextStyle(fontSize: 15)),
              )
            ],
          );
        }));
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/invoice.pdf");
    file.writeAsBytes(await pdf.save());

    return file.readAsBytesSync();

    /*final pdfFile = File("${(await getApplicationDocumentsDirectory()).path}/invoice.pdf");
    await pdfFile.writeAsBytes(pdf.save() as List<int>);*/
  }
}

class InvoiceItem {
  final String itemName;
  final double quantity;
  final double price;

  InvoiceItem(this.itemName, this.quantity, this.price);
}
