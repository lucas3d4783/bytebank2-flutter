import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _contactDao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Nome completo',
              ),
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                ),
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                  onPressed: () {
                    final String name = _fullNameController.text;
                    final int? accountNumber =
                        int.tryParse(_accountNumberController.text);

                    if (name != "" && accountNumber != null) {
                      final Contact newContact = Contact(
                        0,
                        name,
                        accountNumber,
                      );
                      _contactDao
                          .save(newContact)
                          .then((id) => Navigator.pop(context, id));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Adicionar'),
                      Icon(Icons.add),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
