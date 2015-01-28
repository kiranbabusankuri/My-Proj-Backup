trigger autocustomer on Transaction__c (after insert,after delete)
 {
 list<customer__c> ctlist =new list<customer__c>();
 list<customer__c> ctnewlist=new list<customer__c>();
 set<id> set1=new set<id>();
 if(trigger.isinsert)
 {
 for(Transaction__c tr:trigger.new)
 {
 set1.add(tr.customer__c);
 }
 if(set1.size()>0 && set1!=null)
 {
 ctlist=[select id,name,Transaction__c from customer__c where id in:set1];
 for(customer__c ct:ctlist)
 {
 if(ct.Transaction__c!=true)
 {
 ct.Transaction__c=true;
 ctnewlist.add(ct);
 }
 }
 }
 if(ctnewlist.size()>0 && ctnewlist!=null)
 {
 update ctnewlist;
 }
 }
 }