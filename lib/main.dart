// void main() {
//   var nums = [40,10,4,2,90,2,4,4];
//   var map = {};
//
//   for (var num in nums) {
//     map[num] = (map[num] ?? 0) + 1;
//   }
//
//   print(map);
// }

// void main() {
//   String s = "Ram is a boy";
//   List<String> words = s.split(" ");
//   String result = "";
//
//   for (var word in words) {
//     String reversed = "";
//     for (int i = word.length - 1; i >= 0; i--) {
//       reversed += word[i];
//     }
//
//     result += reversed + " ";
//   }
//
//   // remove last extra space (optional)
//   print(result.trim());
// }

// void main(){
//   var a = [[1,2],[3,4],[5]];
//   var b = [];
//   for (var element in a) {
//     for (var element1 in element) {
//       b.add(element1);
//     }
//   }
//
//   print(b);
// }

// void main(){
//   var a=202;
//   var rev = 0;
//   var temp = a;
//   while(temp !=0){
//     var rem = temp %10;
//     rev = rev * 10 + rem;
//     temp = temp ~/10;
//   }
//
//   if(a==rev){
//     print("Palindrome");
//   }else{
//     print("Not Palindrome");
//   }
// }
void main(){
  var a=153;
  var rev = 0;
  var temp = a;
  while(temp !=0){
    var rem = temp %10;
    rev = rev + (rem*rem*rem);
    temp = temp ~/10;
  }

  if(a==rev){
    print("Armstrong");
  }else{
    print("Not Armstrong");
  }
}

