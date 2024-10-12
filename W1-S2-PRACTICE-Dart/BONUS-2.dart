void main(){

  Map<String, String> matchingBracket = {
    ")" : "(",
    "}" : "{",
    "]" :  "["
  };

  List<String> stack = [];

  bool isValid(String s){
    for(int i=0; i<s.length ; i++){
      String char = s[i];
      if(char == "(" || char == "{" || char == "["){
         stack.add(char);
      }else if(char == ')' || char == '}' || char ==']'){
         if(stack.isNotEmpty && stack.last == matchingBracket[char]){
          stack.removeLast();
         }else{
          return false;
         }
      }
    }
    
    return stack.isEmpty;
  }

  String result = '';
  isValid("[{(Testing)}]") ?result = "balanced" : result = "not balanced";
  print(result);
}