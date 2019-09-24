void main(){
var lista = [5, 2, 9, 15, -3, 0];
print(lista.where(between(5, 10)));
}

between(int min, int max){
  var f = (int n){
    return (min <= n && n <= max);
  };
  return f;
}