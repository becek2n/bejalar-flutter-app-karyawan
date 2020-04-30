import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Karyawan extends StatefulWidget {
 const Karyawan({Key key}) : super(key: key);
  
  @override
  _KaryawanState createState() => new _KaryawanState();
}

class _KaryawanState extends State<Karyawan>{

  final _ctrTxtName = TextEditingController(), 
        _ctrTxtPhone = TextEditingController(),
        _ctrTxtEmail = TextEditingController();

  int _idDepartment, _valueJabatan;
  List<DropdownClass> _jabatan = new List<DropdownClass>();
  List<DropdownClass> _department = new List<DropdownClass>();
  
  @override
  void initState() {
    //list jabatan
    _jabatan.add(new DropdownClass(0, "Officer"));
    _jabatan.add(new DropdownClass(1, "Senior Officer"));
    _jabatan.add(new DropdownClass(2, "Assistant Manager"));
    _jabatan.add(new DropdownClass(3, "Manager"));
   
    //list department
    _department.add(new DropdownClass(0, "Operation"));
    _department.add(new DropdownClass(1, "Marketing"));
    _department.add(new DropdownClass(2, "IT"));
    _department.add(new DropdownClass(3, "SDM"));
   super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Karyawan"),
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        height: _height,
        width: _width,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: new SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 180.0),
                      child: Text("Input Data", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
                    ),
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 45.0, left: 45.0),
                  child: new TextFormField(
                    controller: _ctrTxtName,
                    decoration:  InputDecoration(
                      labelText: 'Nama', 
                      icon: Icon(Icons.person),
                    ),
                    style: new TextStyle(color: Colors.redAccent),
                    keyboardType: TextInputType.text,
                  ),
                ),  
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 45.0, left: 45.0),
                  child: new TextFormField(
                    controller: _ctrTxtPhone,
                    decoration: const InputDecoration(labelText: 'No Telp', icon: Icon(Icons.phone)),
                    keyboardType: TextInputType.number,
                    style: new TextStyle(color: Colors.redAccent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 45.0, left: 45.0),
                  child: new TextFormField(
                    controller: _ctrTxtEmail,
                    decoration: const InputDecoration(labelText: 'Email', icon: Icon(Icons.email)),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(color: Colors.deepOrange),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 45.0, left: 45.0),
                    child: new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.business),
                          labelText: 'Department',
                        ),
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                _idDepartment = newValue;
                              });
                            },
                            items: _department.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.value),
                                value: item.id,
                              );
                            }).toList(),
                            value: _idDepartment,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 45.0, left: 45.0),
                    child: new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.recent_actors),
                          labelText: 'Jabatan',
                        ),
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _valueJabatan,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                              });
                            },
                            items: _department.map((item) {
                              return DropdownMenuItem(
                                child: Text(item.value),
                                value: item.id,
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: SizedBox(
                        width: 300.0, // match_parent
                        child: new RaisedButton(
                          onPressed: (){},
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: new Text('Simpan'),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                      )
                    ),
                  ],
                )
                
              ],
            ),
          )
        ),
      ),
    );
  }
}

class DropdownClass {
  final int id;
  final String value;
  
  DropdownClass(this.id, this.value);
}