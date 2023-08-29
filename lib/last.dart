import 'package:flutter/material.dart';

import 'second.dart';


class ScreenB extends StatefulWidget{
  List<InvoiceItem> invoiceItems = [];
  double subtotal = 0;
  double taxRate = 0.1;
  double Total = 0;
  ScreenB({required this.invoiceItems,required this.subtotal,required this.taxRate,required this.Total, required double total});
  @override
  State<ScreenB> createState() => _ScreenBState(invoiceItems: invoiceItems, subtotal: subtotal, taxRate:taxRate,Total: Total);
}

class _ScreenBState extends State<ScreenB> {
  List<InvoiceItem> invoiceItems = [];
  _ScreenBState({required this.invoiceItems,required this.subtotal,required this.taxRate,required this.Total}){
    total = List<double>.filled(invoiceItems.length, 0.0);
  }
  List<double> total = [];
  double subtotal = 0;
  double taxRate = 0.1;// 10% tax rate, change this according to your needs
  double Total = 0;
  @override
  void initState() {
    // TODO: implement initState
    for(int i=0; i<invoiceItems.length; i++){
      total[i]= invoiceItems[i].quantity*invoiceItems[i].price;
    }

    for(int i=0; i<invoiceItems.length; i++){

    }
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(margin: EdgeInsets.only(top: 25,left: 10,right: 10),
          height: MediaQuery.of(context).size.height-30,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
          ),
          child: Center(
            child: Container(margin: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height-50,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(margin: EdgeInsets.only(bottom: 70),
                          height: 100,
                          width: 160,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 65,
                                width: 100,
                                color: Colors.grey,
                                child: Image(
                                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRHr-8XqO7A-C_5Qzejfk1jmvJmKwOU7xrww&usqp=CAU"),fit: BoxFit.fill,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(),
                                child: RichText(text: TextSpan(
                                    text: "Your Company Inc",style: TextStyle(
                                    fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold
                                )
                                ),
                                ),
                              ),
                              RichText(text: TextSpan(
                                  text: "Company No: u-135791",style: TextStyle(
                                  fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold)
                              ),
                              ),
                            ],
                          )
                      ),
                      Container(
                        height: 65,
                        width: 160,
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("INVOICE",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                            Padding(
                              padding: EdgeInsets.only(top: 1),
                              child: Text("Invoice No:  INV-2345622"),
                            ),
                            Text("Invoice Date:  2023-06-23"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(margin: EdgeInsets.only(right: 69,),
                    height: 105,
                    width: 270,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Unit 1, Lingkaran Syed Putra",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                        Text("Mid Valley City",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                        Text("5900 Kuala Lumpur ",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                        Text("Wilayah Persekutuan Kuala Lumpur",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                        Text("Tel: 03-9876 2345",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),

                  ),
                  Container(margin: EdgeInsets.only(right: 50,top: 25),
                    height: 141,
                    width: 290,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bill To:",style: TextStyle(
                          fontSize: 17,color: Colors.black,fontWeight: FontWeight.w800,
                        ),),
                        Container(
                          height: 1,
                          width: 290,
                        ),
                        Text("Target Company Inc",style: TextStyle(
                          fontSize: 17,color: Colors.black,fontWeight: FontWeight.w800,
                        ),),
                        Text("Unit 999, Lingkaran Syed Putra",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                        Text("Mid Valley City",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                        Text("5900 Kuala Lumpur ",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                        Text("Wilayah Persekutuan Kuala Lumpur",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                        Text("Tel: 03-9876 2345",style: TextStyle(
                            fontSize: 17,color: Colors.black,fontWeight: FontWeight.w400
                        ),),
                      ],
                    ),
                  ),
                  Container(margin: EdgeInsets.only(top: 30),
                      height: 95,
                      width: 350,
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        columnWidths: {0: FixedColumnWidth(1), 1: FixedColumnWidth(4),2:FixedColumnWidth(1.7), 3:FixedColumnWidth(2.4),4:FixedColumnWidth(2)},
                        border: TableBorder(
                          top: BorderSide(
                              color: Colors.black,width: 2
                          ),
                          bottom: BorderSide(
                              color: Colors.black,width: 2
                          ),
                          right: BorderSide(
                              color: Colors.black,width: 2
                          ),
                          left: BorderSide(
                              color: Colors.black,width: 2
                          ),
                          horizontalInside: BorderSide(color: Colors.black,width: 1),
                          verticalInside: BorderSide(color: Colors.black,width: 1),
                        ),
                        children: [
                          TableRow(
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Center(child: Text("NO",textScaleFactor: 1,style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.w700
                                  ),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Center(child: Text("Description",textScaleFactor: 0.9,style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.w700
                                  ),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Center(child: Text("Quantitiy",textScaleFactor: 1,style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.w700
                                  ),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Center(child: Text("Unit Pric",textScaleFactor: 1,style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.w700
                                  ),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Center(child: Text("Price",textScaleFactor: 1,style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.w700
                                  ),)),
                                ),
                              ]
                          ),
                          for(int i = 0 ; i< invoiceItems.length;i++)...[
                            TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Center(
                                      child: Text("${i+1}"),),
                                  ),
                                  Center(child: Text(invoiceItems[i].itemName),),
                                  Center(child: Text("${invoiceItems[i].quantity}"),),
                                  Center(child: Text("${invoiceItems[i].price}"),),
                                  Center(child: Text("${total[i]}"),),
                                ]
                            ),
                          ]

                        ],
                      )
                  ),
                  Container(margin: EdgeInsets.only(left: 205),
                      height: 95,
                      width: 135,
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        columnWidths: {0: FixedColumnWidth(1), 1: FixedColumnWidth(1),},
                        border: TableBorder(
                          bottom: BorderSide(
                              color: Colors.black,width: 2
                          ),
                          right: BorderSide(
                              color: Colors.black,width: 2
                          ),
                          left: BorderSide(
                              color: Colors.black,width: 2
                          ),
                          horizontalInside: BorderSide(color: Colors.black,width: 1),
                          verticalInside: BorderSide(color: Colors.black,width: 1),
                        ),
                        children: [
                          TableRow(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(3),
                                  child: Center(child: Text("Subtotal",style: TextStyle(
                                      fontWeight: FontWeight.w800
                                  ),),),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(3),
                                  child: Center(child: Text(subtotal.toStringAsFixed(2),style: TextStyle(
                                      fontWeight: FontWeight.w800
                                  ),),),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(3),
                                  child: Center(child: Text("Tax Amount",style: TextStyle(
                                      fontWeight: FontWeight.w800
                                  ),),),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(3),
                                  child: Center(child: Text(taxRate.toStringAsFixed(2),style: TextStyle(
                                      fontWeight: FontWeight.w800
                                  ),),),
                                ),
                              ]
                          ),
                          TableRow(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(3),
                                  child: Center(child: Text("Grand total",style: TextStyle(
                                      fontWeight: FontWeight.w800
                                  ),),),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(3),
                                  child: Center(child: Text(Total.toStringAsFixed(2),style: TextStyle(
                                      fontWeight: FontWeight.w800
                                  ),),),
                                ),
                              ]
                          )
                        ],
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text("The tax invoice is computer generated and no signature is required",style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}