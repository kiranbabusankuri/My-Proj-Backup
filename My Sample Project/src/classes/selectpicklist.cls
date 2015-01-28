public with sharing class selectpicklist {

    public selectpicklist(ApexPages.StandardController controller) {

    }


public string yearvalue{set;get;}
     public string yearvalue1{set;get;}
     public string yearvalue2{set;get;}
     public string yearvalue3{set;get;}
     public list<selectoption>getyearlist()
     {
     
     list<selectoption> options = new list<selectoption>();
     options.add(new selectoption(',','---None--'));
     options.add(new selectoption('100','2010'));
     options.add(new selectoption('200','2011'));
     options.add(new selectoption('300','2012'));
     return options;
     }
     public void picklist()
     {
     if(yearvalue=='100')
     {
     yearvalue1='true';
    yearvalue2='false';
     yearvalue3='false';
     }
     else
          if(yearvalue=='200')
          {
          yearvalue2='true';
     yearvalue1='false';
     yearvalue3='false';
     }
       else
       {
       yearvalue1='false';
       yearvalue2='false';
       yearvalue3='false';
       }
      }
      }