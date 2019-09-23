void main(){
  List<int> initNums = [0, 1, 2, 3, 2, 77, 5, 5, 76, 75, 76, 4, 6, 10,11,10,8,8,9];
  print(initNums);
  print("Single nums:");
  print(singles(initNums));
}

List<int> singles(List<int> nums){

  List<int> ret = List<int>();
  Map<int, int> numCounter = Map<int, int>();
  
  for(int n in nums)
  {
    if(numCounter.containsKey(n))
      numCounter[n] += 1;
    else
      numCounter[n] = 1;
  }
  print(numCounter);
  
  var findSingleNums = (int index, int value){
    if(value == 1)
      ret.add(index);
  };
  numCounter.forEach(findSingleNums);

  return ret;
}