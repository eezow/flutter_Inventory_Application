import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //const NewTransaction({super.key});
  final Function newtx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.newtx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              //  },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,

              //  onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: () {
                newtx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text('Add transactions'),
              style: TextButton.styleFrom(foregroundColor: Colors.brown),
            )
          ],
        ),
      ),
    );
  }
}
