import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/order.dart';

class OrdetItemWidget extends StatefulWidget {
  final OrderItem order;
  OrdetItemWidget(this.order);

  @override
  _OrdetItemWidgetState createState() => _OrdetItemWidgetState();
}

class _OrdetItemWidgetState extends State<OrdetItemWidget> {
  var _exPanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/mm/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
                icon: Icon(_exPanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _exPanded = !_exPanded;
                  });
                }),
          ),
          if (_exPanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 10, 180),
              child: ListView(
                children: widget.order.products
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            e.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${e.quantity}x \$${e.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
