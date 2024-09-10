import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../../pages/ordens/ordens_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_plugin_openwhatsapp/flutter_plugin_openwhatsapp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  //final _formData = Map<String, String>();
  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();
  }

  final accessToken =
      'EAAQKzJZABI3sBO7LEQFO7OtFwBy56Sx3vzudnSbN3Sb31TZCRwtT3LXDwlOXBmqQBCso89copxvJYpN08IQq5MYtZAJI4ez5IBX68aat9WixTBquI7uMV0vb937WOKNKIH2AZAror63NVRNyHG1t8T3ksx8FvVsvpmXvhIFzQ0pk3LkX4suxJNtUhJ1rW0o2Ws8xr4sZC0Sn76HFWWEZCEexDaNtka5O3ypZAmZBZBjlm';
  final fromNumberId = '31920068022';

  final TextEditingController _placa = TextEditingController();
  String placa = "";
  var mask = MaskTextInputFormatter(mask: 'AAA-#*##');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //backgroundColor: Color.fromARGB(255, 252, 252, 252),
      body: SingleChildScrollView(
        child: _loginPageUI(),
      ),
      //bottomNavigationBar: BotoomNavigator(0),
    );
  }

  Widget _loginPageUI() {
    double deviceWidth = MediaQuery.of(context).size.width;
    //double _deviceHeigth = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.10),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(height: 160),
            _headingLogo(),
            Container(height: 20),
            _formPlaca(),
            Container(height: 20),
            _placaButton(),
            Container(height: 20),
            _placaButton1(),
          ],
        ),
      ),
    );
  }

  Widget _headingLogo() {
    return Container(
      height: 250,
      width: 250,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/logo.png'), fit: BoxFit.fill)),
    );
  }

  Widget _formPlaca() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(143, 148, 251, .6),
              blurRadius: 20,
              offset: Offset(0, 10))
        ],
      ),
      child: Column(
        children: <Widget>[
          _inputPlaca(),
        ],
      ),
    );
  }

  Widget _inputPlaca() {
    return TextFormField(
      onChanged: (valor) => placa = valor,
      controller: _placa,
      inputFormatters: [UpperCaseTextFormatter()],
      maxLength: 7,
      autocorrect: false,
      autofocus: true,
      style: const TextStyle(color: Color.fromARGB(255, 49, 11, 114)),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: null,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          hintStyle: const TextStyle(color: Color.fromARGB(255, 166, 162, 171)),
          contentPadding: const EdgeInsets.all(10),
          hintText: 'Placa do veículo: Formato: AAA****'),
      validator: (_placa) {
        final placa = _placa.toString();

        if ((placa).toString().trim().isEmpty) {
          return 'O campo Placa é um campo obrigatório';
        }

        if ((placa.toString().trim()).length < 7) {
          return 'O campo Placa deve ter 7 caracteres';
        }
        return null;
      },
      onSaved: (placa) {
        //print(placa);
        //Navigator.pushReplacementNamed(context, '/ordem', arguments: placa);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>OrdemPage(placa: placa ?? '')),(Route<dynamic> route) => false);
      },
    );
  }

  Widget _placaButton() {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: deviceWidth,
      child: MaterialButton(
        onPressed: () {
          _submitForm();
        },
        color: Theme.of(context).primaryColor,
        textColor: const Color.fromARGB(255, 251, 251, 249),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Text('Buscar Ordens de Serviços'),
      ),
    );
  }

  Widget _placaButton1() {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: deviceWidth,
      child: MaterialButton(
        onPressed: () async {
          final flutterPlugin = FlutterPluginOpenwhatsapp();
          var platform = defaultTargetPlatform;
          if (platform == TargetPlatform.android) {
            await flutterPlugin.openWhatsApp(
              phoneNumber: '31920068022',
              text:
                  'Seja bem vindo! Solicite informações ou agende um horário.',
            );
          }
        },
        color: const Color.fromARGB(255, 41, 172, 96),
        textColor: const Color.fromARGB(255, 251, 251, 249),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: const Text('Entre em contato.'),
      ),
    );
  }
}
