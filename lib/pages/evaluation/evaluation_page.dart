import 'package:flutter/material.dart';
import '../../widgets/botoom_navigator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliar o serviço'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 250, 250, 251),
            fontSize: 30,
            fontWeight: FontWeight.bold),
        toolbarTextStyle: const TextStyle(color: Colors.white),
      ),
      body: _buildEvaluationPage(context),
      bottomNavigationBar: BotoomNavigator(1),
    );
  }

  Widget _buildEvaluationPage(context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          _buildHeader(context),
          Container(height: 5),
          _buildFormEvaluation(context),
        ],
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
        child: Text(
      "Avaliar o serviço n° 1",
      //textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ));
  }

  Widget _buildFormEvaluation(context) {
    double deviceWidth = (MediaQuery.of(context).size.width - 100);
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              print(value);
            },
          ),
          Container(height: 40),
          TextFormField(            
            autocorrect: true,
            style: TextStyle(color: Theme.of(context).primaryColor),
            cursorColor: Theme.of(context).primaryColor,
            onSaved: (value) {
              print(value);
            },
            decoration: InputDecoration(
              labelText: 'Comentário (ex: Excelente!)',
              labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Container(height: 10),
          SizedBox(
            width: deviceWidth,
            child: MaterialButton(
              onPressed: () {
                print('vai salvar');
              },
              elevation: 5,
              color: Theme.of(context).primaryColor,
              textColor: const Color.fromARGB(255, 251, 251, 249),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: const Text('Avaliar Serviço'),
            ),
          ),
        ],
      ),
    );
  }
}
