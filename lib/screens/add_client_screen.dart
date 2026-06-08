import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ge01_crud_front/providers/client_provider.dart';
import 'package:provider/provider.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _addrCtrl = TextEditingController();
  final TextEditingController _municipalityCtrl = TextEditingController();
  final TextEditingController _departmentCtrl = TextEditingController();
  final TextEditingController _occupationCtrl = TextEditingController();
  final TextEditingController _dobCtrl = TextEditingController();

  DateTime? _selectedDob;

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _addrCtrl.dispose();
    _municipalityCtrl.dispose();
    _departmentCtrl.dispose();
    _occupationCtrl.dispose();
    _dobCtrl.dispose();
    super.dispose();
  }

  void _pickDob() async {
    final now = DateTime.now();
    final initial = _selectedDob ?? DateTime(now.year - 25);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selectedDob = picked;
        _dobCtrl.text = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final clientData = {
      'first_Name': _firstNameCtrl.text.trim(),
      'last_Name': _lastNameCtrl.text.trim(),
      'email': _emailCtrl.text.trim(),
      'phone_Number': _phoneCtrl.text.trim(),
      'addr1': _addrCtrl.text.trim(),
      'municipality': _municipalityCtrl.text.trim(),
      'department': _departmentCtrl.text.trim(),
      'occupation': _occupationCtrl.text.trim(),
      'dob': _dobCtrl.text.trim(),
    };

    final clientProvider = Provider.of<ClientProvider>(context, listen: false);
    clientProvider.insertClient(clientData);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cliente listo para guardar')));
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Crear nuevo Cliente'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        actions: [
          IconButton(
            tooltip: 'Ir al inicio',
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
        ],
      ),
      body: createClientForm(),
      bottomNavigationBar: createClientButton(context),
    );
  }

  SafeArea createClientButton(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            _save();
          },
          child: Text('Guardar Cliente', style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }

  SingleChildScrollView createClientForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _firstNameCtrl,
              decoration: InputDecoration(labelText: 'First Name'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _lastNameCtrl,
              decoration: InputDecoration(labelText: 'Last Name'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _emailCtrl,
              autocorrect: false,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                return EmailValidator.validate(value.toString())
                    ? null
                    : 'El valor ingresado no es un correo electronico';
              }, 
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _phoneCtrl,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              validator: (v) => (v != null && v.trim().length >= 6) ? null : 'Enter a valid phone',
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _addrCtrl,
              decoration: InputDecoration(labelText: 'Addr1'),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _municipalityCtrl,
              decoration: InputDecoration(labelText: 'Municipality'),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _departmentCtrl,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _occupationCtrl,
              decoration: InputDecoration(labelText: 'Occupation'),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _dobCtrl,
              decoration: InputDecoration(labelText: 'DOB (YYYY-MM-DD)'),
              readOnly: true,
              onTap: _pickDob,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Select date' : null,
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
