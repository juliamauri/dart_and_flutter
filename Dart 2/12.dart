
void main(){

  var esPrimo = (int n){
    for (int d = 2; d*d <= n; d++) {
      if (n % d == 0) return false;
    }
    return n > 1;
  };

  List<int> init_nums = [0, 7, 12, 54, 9, 87, 35, 11, 12, 8, 15];
  print(init_nums);
  print("Son primos:");
  print(count_if(init_nums, esPrimo));
}

List<int> count_if(List<int> nums, Function f)
{
  List<int> ret = List<int>();
  for(int x in nums)
      if(f(x))
        ret.add(x);
  return ret;
}