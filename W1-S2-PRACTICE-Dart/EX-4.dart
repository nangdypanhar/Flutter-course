
void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  
  double totalResult = 0;
  pizzaPrices.forEach((key,value){
      if(order.contains(key)){
        totalResult += value;
      }
  });
  
  print(totalResult);
  
}