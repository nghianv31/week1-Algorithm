String highestValuePalindrome(String s, int n, int k){
  final List<String> chars = s.split('');
  int left =0;
  int right = n-1;
  while(left<=right){
    if (k == 1 && n ==1){
      return '9';
    }
    else if (chars[left] != chars[right] && (chars[left] == '9' || chars[right] == '9')) {
      if (k <= 0) {
        return '-1';
      }
      final maxChar = chars[left].compareTo(chars[right]) > 0 ? chars[left] : chars[right];
      chars[left] = maxChar;
      chars[right] = maxChar;
      k--;
    }
    else if (chars[left] != chars[right]) {  //9 3 2 2 3 9  
      if (k < 2) {
        return '-1';
      }
      chars[right] = chars[left] = 9.toString();
      k -=2;
    }
    
    left++;
    right--;
  }
  if (k > 0) {
    left = 0;
    right = n - 1;
    while (left <= right) {
      if (chars[left] == chars[right] && chars[left] != '9') {
        if (k < 2) {
          break;
        }
        chars[left] = chars[right] = '9';
        k -= 2;
      } else if (chars[left] != chars[right]) {
        if (k < 1) {
          break;
        }
        chars[left] =  '9';
        k--;
        
      }
      left++;
      right--;
    }
  }
  return chars.join('');
}

String highestValuePalindrome2(String s, int n, int k) {
  List<String> chars = s.split('');
  int left = 0;
  int right = n - 1;

  while (left < right) {
    if (chars[left] != chars[right]) {
      if (chars[left].compareTo(chars[right]) > 0) {
        chars[right] = chars[left];
      } else {
        chars[left] = chars[right];
      }
      k--;
    }
    left++;
    right--;
  }

  if (k < 0) {
    return '-1';
  }

  left = 0;
  right = n - 1;

  while (left <= right) {
    if (left == right) {
      if (k > 0) {
        chars[left] = '9';
      }
      break;
    }

    if (chars[left] != '9') {
      int cost = 2;
      if (s.codeUnitAt(left) != s.codeUnitAt(right)) {
        cost = 1;
      }

      if (k >= cost) {
        chars[left] = '9';
        chars[right] = '9';
        k -= cost;
      }
    }
    left++;
    right--;
  }

  return chars.join('');
}
