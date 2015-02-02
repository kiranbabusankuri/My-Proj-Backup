public class Calculator 
{
public integer number1{get;set;}
public integer number2{get;set;}
public string operator{get;set;}
public double result{get;set;}
public void calculation()
{
if(operator.contains('+'))
result=number1+number2;
if(operator.contains('-'))
result=number1-number2;
if(operator.contains('*'))
result=number1*number2;
if(operator.contains('/'))
result=number1/number2;
}
}