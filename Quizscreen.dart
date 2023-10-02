
import 'package:flutter/material.dart';
import 'package:quiz/question_modal.dart';
 
 class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
 

 List<Question> questionList = getQuestion();
 int currentQuestionIndex =0;
 int score =0;
 Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.lightBlue,
body: Container(
  margin: const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 32),
  child:  Column
  (mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    const Text(
      "QUIZAPP",style: TextStyle(
        fontSize: 24,
      ),
    ),
    _questionWidget(),
     _anserList(),
      _nextButton(),
    
  ]),
),
    );
  }
  _questionWidget(){


    return   Column(
       crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
  Text("Questions ${currentQuestionIndex+1}/${questionList.length.toString()})",style:const TextStyle(
          color: Colors.white,
          fontSize: 20,
          
        ),),
 const SizedBox(height: 20),
 Container(
  alignment: Alignment.center,
  width: double.infinity,
  padding: const EdgeInsets.all(32),
  decoration: BoxDecoration(
    color: Colors.lime,
    borderRadius: BorderRadius.circular(16),
  ),
child:  Text(
  questionList[currentQuestionIndex].questiontext,
  style: const TextStyle(
    color: Colors.deepPurpleAccent,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
),
 )
      ],
    );
    
  }
  _anserList(){
    return Column(
children: 
  questionList[currentQuestionIndex].answerList.map((e) => _answerButton(e),
  )
  .toList(),

    );
  }
  Widget _answerButton(Answer answer){
    bool isSelected = answer==selectedAnswer;
    return  Container(

      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      // ignore: sort_child_properties_last
      child: ElevatedButton(child: Text(answer.answerText),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        // ignore: deprecated_member_use
        primary: isSelected? Colors.purple: Colors.white,
        // ignore: deprecated_member_use
        onPrimary:  isSelected? Colors.white: Colors.brown,
      ),
      onPressed: () {
        if (selectedAnswer == null){
          if(answer.isCorrect){
            score++;
          }
           setState(() {
          selectedAnswer =answer;
        });
        }
       
      },
      ),
    );
  }
  _nextButton(){
    // ignore: unused_local_variable
    bool islastQustions =false;
    if(currentQuestionIndex==questionList.length-1){
      islastQustions =true;
    }
     return  Container(

      width: MediaQuery.of(context).size.width*0.5,
    
      height: 48,
      // ignore: sort_child_properties_last
      child: ElevatedButton(child:  Text ( islastQustions?"Submit":"Next"),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        // ignore: deprecated_member_use
        primary:  Colors.green,
        // ignore: deprecated_member_use
        onPrimary:   Colors.white,
      ),
      onPressed: () {
       if(islastQustions){
showDialog(context: context, builder: (_)=> _showScoreDialog());
       }
       else{
        setState(() {
          selectedAnswer =null;
          currentQuestionIndex++;
        });
       }
       
      },
      ),
    );
  }
  _showScoreDialog(){
    bool ispased =false;
    if(score>=questionList.length *0.6){
      ispased =true;
    }
    String title = ispased? "passed":"Falied";
    return AlertDialog(
     
      // ignore: prefer_interpolation_to_compose_strings
      title: Text(title+ "|Score is $score",style: TextStyle(
    color: ispased? Colors.blueGrey:Colors.redAccent 
      ),),
      content: ElevatedButton(child: const Text("Restart"),onPressed: () {
        Navigator.pop(context);
        setState(() {
           currentQuestionIndex =0;
        score=0;
        selectedAnswer =null;
        });
      
      },),
    );
  }
}