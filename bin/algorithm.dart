import 'package:algorithm/algorithm.dart' as algorithm;
import 'package:algorithm/palindrome.dart' as palindrome;
void main(List<String> arguments) {
  algorithm.encryption('haveaniceday');
  algorithm.encryption('feedthedog');
  algorithm.encryption('chillout');

  print(palindrome.highestValuePalindrome('3943', 4, 4));
}
