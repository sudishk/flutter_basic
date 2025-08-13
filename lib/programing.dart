void main(){
  var mainLoop = 1;
  var primeCount =0;
  do{  // 100 times repeat work
    var childLoop = 1; // storing loop value to check prime
    var count =0;
    do{
      if(mainLoop%childLoop ==0){
        count++;
      }
      childLoop ++;
    }while(childLoop <=  mainLoop);

    if(count<= 2){
      primeCount++;
      // print("$mainLoop is a prime number");
    }
    mainLoop++;
  }while(mainLoop < 100);

  print(primeCount);
}