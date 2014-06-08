import java.util.*;
import java.io.*;

public class Stack<T>{
  @SuppressWarnings("unchecked")
  T[] array=(T[]) new Object[0];
    
  public boolean empty(){
    return array.length==0;
  }
    
  public T peek(){
    if(empty())
      throw new EmptyStackException();
    return array[array.length-1];
  }

  public T pop(){
    T sub=peek();
    @SuppressWarnings("unchecked")
    T[] temp=(T[])new Object[array.length-1];
    for(int i=0;i<array.length-1;i++){
      temp[i]=array[i];
    }
    array=temp;
    return sub;
  }
    
  public T push(T item){
    @SuppressWarnings("unchecked")
    T[] temp=(T[])new Object[array.length+1];
    for(int i=0;i<array.length;i++){
      temp[i]=array[i];
    }
    temp[temp.length-1]=item;
    array=temp;
    return item;
  }
    
  public int search(Object o){
    for(int i=array.length-1;i>-1;i--){
      if (array[i].equals(o))
        return array.length-i;
    }
    return -1;
  }
}

