import 'package:flutter/material.dart';

class StockInputForm extends StatefulWidget {
  final void Function(String symbol, DateTime purchaseDate, DateTime sellDate, int quantity) onSubmit;

  StockInputForm({required this.onSubmit});

  @override
  _StockInputFormState createState() => _StockInputFormState();
}

class _StockInputFormState extends State<StockInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _symbolController = TextEditingController();
  final _quantityController = TextEditingController();
  DateTime? _purchaseDate;
  DateTime? _sellDate;

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _purchaseDate != null &&
        _sellDate != null &&
        _purchaseDate!.isBefore(_sellDate!)) {
      widget.onSubmit(
        _symbolController.text,
        _purchaseDate!,
        _sellDate!,
        int.parse(_quantityController.text),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select valid dates and fill all fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _symbolController,
            decoration: InputDecoration(labelText: 'Stock Symbol'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a stock symbol';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityController,
            decoration: InputDecoration(labelText: 'Quantity'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty || int.tryParse(value) == null) {
                return 'Please enter a valid quantity';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _purchaseDate = selectedDate;
                      });
                    }
                  },
                  child: Text(_purchaseDate == null
                      ? 'Select Purchase Date'
                      : 'Purchase Date: ${_purchaseDate!.toLocal().toString().split(' ')[0]}'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _sellDate = selectedDate;
                      });
                    }
                  },
                  child: Text(_sellDate == null
                      ? 'Select Sell Date'
                      : 'Sell Date: ${_sellDate!.toLocal().toString().split(' ')[0]}'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Calculate Return'),
          ),
        ],
      ),
    );
  }
}
