void main(){
  f(true);
  f(false, s:'nada');
  f(false, n: -1);
  f(true, s:'algo', n: 65);
  f(true,  n: 65, s:'algo');
}
void f(bool b, {String s = '<nada>', int n}){}