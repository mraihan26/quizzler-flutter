class Question{
  String _pertanyaan;
  bool _jawaban;

  Question(String q, bool a){
    this._pertanyaan = q;
    this._jawaban = a;
  }

  String getQ(){
    return this._pertanyaan;
  }

  bool getA(){
    return this._jawaban;
  }

}