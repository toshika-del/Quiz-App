class Question{
late final String questiontext;
late final List<Answer> answerList;
Question(this.questiontext,this.answerList);
}


class Answer{
  late final String  answerText;
  late final bool isCorrect;
  Answer(this.answerText,this.isCorrect);
}

List<Question> getQuestion(){
  List<Question> list =[];

  list.add(
  
  Question("Who is the owner of flutter?",
  [
Answer("NOkia", false),
Answer("Samumg", false),
Answer("Google", true),
Answer("Apple", false),
  ],)

  );
list.add(
  
  Question("2+2 is equal to ----?",
  [
Answer("3", false),
Answer("1", false),
Answer("4", true),
Answer("9", false),
  ],)

  );
  list.add(
  
  Question("chatgpt is the ?",
  [
Answer("human", false),
Answer("Robert", false),
Answer("Al", true),
Answer("Apple", false),
  ],)

  );
  list.add(
  
  Question("Youtube is platform ------",
  [
Answer("to making reels", false),
Answer("Sharing phots", false),
Answer("Sharing Vedio", true),
Answer("Eating", false),
  ],)

  );
  list.add(
  
  Question("Who owns iphone?",
  [
Answer("NOkia", false),
Answer("Apple", true),
Answer("Samumg", false),
Answer("Google", false),

  ],)

  );


  return list;
}