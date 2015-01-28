public class Example1 {
public integer Bvalue{get;set;}
public integer Avalue{get;set;}
public string operation{get;set;}
public integer result{get;set;}

public pagereference subb()
{
  operation='subtraction';
  result=Avalue-Bvalue;
 
  return null;
  }
    public pagereference add()
    {
      operation='addition';
      result =Avalue+Bvalue;
     
      return null;
      }
     }