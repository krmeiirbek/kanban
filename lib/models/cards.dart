class Card {
  int id;
  String row;
  int seq_num;
  String text;

  Card({this.id, this.row, this.seq_num, this.text});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'],
      row: json['row'],
      seq_num: json['seq_num'],
      text: json['text'],
    );
  }
}
