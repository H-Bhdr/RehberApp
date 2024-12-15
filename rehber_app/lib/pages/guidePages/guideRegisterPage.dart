import 'package:flutter/material.dart';
import 'package:rehber_app/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:rehber_app/models/travellerRegisterModel.dart';
import 'package:rehber_app/services/travellerRegisterService.dart';

class GuideRegisterPage extends StatefulWidget {
  @override
  _GuideRegisterPageState createState() => _GuideRegisterPageState();
}

class _GuideRegisterPageState extends State<GuideRegisterPage> {
  bool isMale = true;
  bool obscurePassword = true;
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _profilePictureController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _expertiseAreaController = TextEditingController();

  final TravellerRegisterService _registerService = TravellerRegisterService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white, // Arka plan rengi
              borderRadius: BorderRadius.circular(10), // Yuvarlak köşeler
            ),
            child: IconButton(
              icon: Icon(Icons.chevron_left, color: rehberBlue),
              onPressed: () {
                Navigator.of(context).pop(); // Geri butonuna basıldığında yapılacak işlemler
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 355,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: rehberBlue, // Arka plan rengi
                      ),
                      width: double.infinity, // Genişliği kapsayıcıya göre ayarla
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                               Padding(
                      padding: const EdgeInsets.all(20), // Soldan boşluk
                      child: Text(
                        "Kayıt Ol!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24, // Başlık boyutu
                          fontWeight: FontWeight.bold, // Kalın başlık
                        ),
                      ),
                    ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: "isim",
                                hintStyle: TextStyle(color: rehberBlue),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen adınızı giriniz';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _surnameController,
                              decoration: InputDecoration(
                                hintText: "soyisim",
                                hintStyle: TextStyle(color: rehberBlue),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen soyadınızı giriniz';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _mailController,
                              decoration: InputDecoration(
                                hintText: "mail",
                                hintStyle: TextStyle(color: rehberBlue),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return "Bu alan boş geçilemez!";
                              },
                            ),
                          ),
                     
                   
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: obscurePassword,
                              decoration: InputDecoration(
                                hintText: "şifre",
                                hintStyle: TextStyle(color: rehberBlue),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                  icon: Icon(
                                    color: rehberBlue,
                                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) return "Bu alan boş geçilemez!";
                                if (value.length < 3) return "3 karakterden küçük değer girilemez!";
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                hintText: "Telefon Numarası",
                                hintStyle: TextStyle(color: rehberBlue),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen telefon numaranızı giriniz';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _bioController,
                              decoration: InputDecoration(
                                hintText: "Biyografi",
                                hintStyle: TextStyle(color: rehberBlue),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen biyografinizi giriniz';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _profilePictureController,
                              decoration: InputDecoration(
                                hintText: "Profil Resmi URL",
                                hintStyle: TextStyle(color: rehberBlue),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen profil resminizin URL\'sini giriniz';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                hintText: "Açıklama",
                                hintStyle: TextStyle(color: rehberBlue),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen açıklamanızı giriniz';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              controller: _expertiseAreaController,
                              decoration: InputDecoration(
                                hintText: "Uzmanlık Alanı",
                                hintStyle: TextStyle(color: rehberBlue),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen uzmanlık alanınızı giriniz';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // TextFormField'lar ile buton arasında boşluk
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: rehberBlue,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final traveller = TravellerRegisterModel(
                              firstName: _nameController.text,
                              lastName: _surnameController.text,
                              email: _mailController.text,
                              phoneNumber: _phoneController.text,
                              bio: _bioController.text,
                              profilePicture: _profilePictureController.text,
                              description: _descriptionController.text,
                              expertiseArea: _expertiseAreaController.text,
                              password: _passwordController.text,
                            );
            
                            try {
                              await _registerService.registerTraveller(traveller);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Başarıyla kaydolundu')),
                              );
                              _formKey.currentState!.reset();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('kaydolurken bir hata oluştu')),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('kaydolurken bir hata oluştu')),
                            );
                          }
                        },
                        child: Text(
                          'Kayıt Ol',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
