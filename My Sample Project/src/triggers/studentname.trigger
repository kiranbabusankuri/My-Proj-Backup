trigger studentname on student__c (before insert,before update)
 {
 list<student__c> stlist =trigger.new;
 list<student__c> stupdatelist = new list<student__c>();
 list<student__c> stnewlist = new list<student__c>();
 for(student__c st:stlist)
 {
 stnewlist=[select id,name from student__c where name=:st.name];
 integer i=0;
 if(stnewlist.size()>0)
 {
 for(student__c st1:stnewlist)
 {
 st1.name=st1.name+i;
 i++;
 stupdatelist.add(st1);
 }
 }
 }
 if(stupdatelist.size()>0 && stupdatelist!=null)
 {
 update stupdatelist;
 }
 }