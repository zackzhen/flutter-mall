class UserInfo{

  String name = "";
  String _sex = "sex";
  int _age = 5;
  //
  // int get age => _age;
  //
  // set age(int value) {
  //   _age = value;
  // }
}

getUserInfo(num age,{String? name,bool? flag}){

  print(age);
}

void main(){

  UserInfo user = UserInfo();

  user._age = 666;
  print(user._age);

  getUserInfo(15,name: 'hello');
}