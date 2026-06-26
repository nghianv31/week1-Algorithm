int calculate() {
  return 6 * 7;
}

void encryption(String input) {
  String result = '';
  // replace space
  final replacedSpace = input.replaceAll(' ', '_');
  // length of the string
  final length = replacedSpace.length;
  //caculate sqrt of length
  final sqrtLength = sqrt(length);
  var rows = sqrtLength.floor();
  var columns = sqrtLength.ceil();
  
  if (rows * columns < length) {
    rows =columns;
  }

  print('rows: $rows, columns: $columns');
  for (var i=0; i<columns; i++) {
    for (var j=0; j<rows; j++) {
      final index = j * columns + i;
      if (index < length) {
        result += replacedSpace[index];
      }
    }
    result += ' ';
  }
  print(result);
}

double sqrt(int number) {
  if (number < 0) {
    return -1;
  }
  if (number == 0 || number == 1) {
    return number.toDouble();
  }
  double x = number.toDouble();
  for (var i = 0; i < 20; i++) {
    x = 0.5 * (x + number / x).toDouble();
  }
  return x;
}