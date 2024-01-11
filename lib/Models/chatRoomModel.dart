class ChatRoomModel{
  String? chatroomID;
  List<String>? participants;

  ChatRoomModel({
    this.chatroomID, this.participants
});

  ChatRoomModel.fromMap(Map<String,dynamic> map){
    chatroomID = map["chatroomid"];
    participants = map["participants"];
  }

  Map<String, dynamic> toMap(){
    return{
      "chatroomid" : chatroomID,
      "participants": participants,
    };
  }
}