void main(){
  print(diffDays(DateTime(2019, 5, 24), DateTime(1989,11,9)));
}

String diffDays(DateTime a, DateTime b) => a.difference(b).inDays.toString() + ' days';