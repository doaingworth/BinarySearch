private Item[] store = 
{
  new Item(184, 14), 
  new Item(196, 60), 
  new Item(206, 31), 
  new Item(2370, 65), 
  new Item(7282, 73), 
  new Item(8303, 90), 
  new Item(12328, 63), 
  new Item(12705, 14), 
  new Item(13066, 8), 
  new Item(14088, 92), 
  new Item(15320, 82), 
  new Item(15814, 60), 
  new Item(15917, 51), 
  new Item(17911, 96), 
  new Item(18061, 3), 
  new Item(18410, 56), 
  new Item(18465, 27), 
  new Item(18618, 64), 
  new Item(18871, 69), 
  new Item(19967, 45)
};                             
public int linearSearch(int catNumToFind)
    {
        for (int x = 0; x < store.length; x++) {
            if (store[x].getCatNum() == catNumToFind) {
                return store[x].getInventory();
            }
        }
        return -1;
    }
    public int recursiveLinearSearch(int catNumToFind, int startIndex)
    {
        if (startIndex >= store.length) {
            return -1;
        }
        else if (catNumToFind == store[startIndex].getCatNum()) {
            return store[startIndex].getInventory();
        }
        else {
            return recursiveLinearSearch(catNumToFind, startIndex + 1);
        }
    }
    public int binarySearch(int catNumToFind)
    {
        //complete this method
        if (catNumToFind == store[store.length-1].getCatNum()) {
            return store[store.length-1].getInventory();
        }
        int median = store.length/2;
        for (int x = 2; x < store.length; x++) {
            if (store[median].getCatNum() == catNumToFind) {
                return store[median].getInventory();
            }
            else if (catNumToFind > store[median].getCatNum()) {
                median += store.length / Math.pow(2.0, x);
            }
            else if (catNumToFind < store[median].getCatNum()) {
                median -= store.length / Math.pow(2.0, x);
            }
        }
        return -1;
    }
    public int recursiveBinarySearch(int catNumToFind, int nLow, int nHigh)
    {
        int median = (nLow + nHigh)/2;
        if (catNumToFind > store[store.length-1].getCatNum()) {
            return -1;
        }
        else if (catNumToFind == store[store.length-1].getCatNum()) {
            return store[store.length-1].getInventory();
        }
        else if (/*Math.abs(nLow - nHigh) == 1 || */Math.abs(nLow - nHigh) == 0) {
            return -1;
        }
        else if (store[median].getCatNum() == catNumToFind) {
            return store[median].getInventory();
        }
        else if (catNumToFind > store[median].getCatNum()) {
            return recursiveBinarySearch(catNumToFind, median, nHigh);
        }
        else if (catNumToFind < store[median].getCatNum()) {
            return recursiveBinarySearch(catNumToFind, nLow, median);
        }
        else {
            return -1;
        }
    }
public void setup()
{
  int[] tests = {0, 183, 184, 2370, 15320, 19967, 19968};
  System.out.println();
  System.out.println("Testing Non-Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (linearSearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+linearSearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (recursiveLinearSearch(tests[i],0) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveLinearSearch(tests[i],0) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Non-Recursive Binary Search");
  System.out.println("===================================");
  for (int i = 0; i < tests.length; i++)
  {

    if (binarySearch(tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Binary Search");
  System.out.println("===============================");
  for (int i = 0; i < tests.length; i++)
  {

    if (recursiveBinarySearch(tests[i], 0, store.length - 1) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+recursiveBinarySearch(tests[i], 0, store.length - 1) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
}

public void draw()
{
  //empty!
}






