public with sharing class marksclass {

public string id1;
public Marks__c marks{get;set;}
public boolean popup1{get;set;}

  public marksclass(ApexPages.StandardController controller) {
 
  id1=Apexpages.currentpage().getparameters().get('id');
          if(id1!=null)
  
            {  
                      
              marks = [select    id,student__c,account__c,English__c,
                                 Hindi__c,Telugu__c,Social__c,Science__c,
                                 Mathematics__c from Marks__c  
                                 where id=:id1 limit 1
                       ];

            }
            else 
            {
            marks = new Marks__c ();
            } 

}


public pagereference save() {
 


if(  marks.Student__c== null || marks.English__c == null || marks.Hindi__c == null || 
      marks.Social__c == null  || marks.Mathematics__c==null || 
      marks.Science__c == null || marks.Telugu__c == null ||      
      marks.Science__c >=100 || marks.Science__c <=0 || 
      marks.English__c >= 100 || marks.English__c <= 0 ||
      marks.Hindi__c >=100 || marks.Hindi__c <=0 ||
      marks.Social__c >=100 || marks.Social__c <=0 ||
      marks.Mathematics__c >= 100  ||  marks.Mathematics__c <=0 ||
      marks.Telugu__c >=100 || marks.Telugu__c <=0
)
{
 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'enter all values or all marks between 0 and 100'));
return null;
}

if(marks.Student__c !=null && marks.English__c != null && marks.Hindi__c!=null && marks.Social__c !=null && marks.Mathematics__c !=null && 
   marks.Science__c !=null && marks.Telugu__c != null)
{
 
insert  marks;
popup1 = true;
}
 
   
return null;
}
public pagereference pageredirect() { 
popup1= false;
 pagereference pref = new pagereference('/a0E9000000xFJ6E');
 return pref;
}
}