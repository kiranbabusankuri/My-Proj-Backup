trigger autotransaction on Customer__c (after insert,after update)
{
list<Transaction__c> trlist = new list<Transaction__c>();
list<Transaction__c> trnewlist = new list<transaction__c>();
list<Transaction__c> trdeletelist= new list<Transaction__c>();
if(trigger.isinsert)
 {
  for(Customer__c ct:trigger.new)
  {
   if(ct.Transaction__c == true)
    {
     Transaction__c tr =new Transaction__c();
     tr.name=ct.name+'Transaction';
     tr.Customer__c = ct.id;
     trlist.add(tr);
    }
  }
   if(trlist.size()>0 && trlist!=null)
   {
   insert trlist;
   }
 }
 if(trigger.isupdate)
  {
   for(Customer__c ct:trigger.new)
   {
    if(ct.Transaction__c == true)
    {
     trnewlist =[select id,name from Transaction__c where Customer__c=:ct.id];
     if(trnewlist.size()==0)
      {
       Transaction__c tr= new Transaction__c();
       tr.name=ct.name+'transaction';
       tr.Customer__c=ct.id;
       trlist.add(tr);
      }
    }
    if(ct.Transaction__c == false)
    {
     trnewlist =[select id,name from Transaction__c where Customer__c =:ct.id];
     if(trnewlist.size()>0)
     {
      trdeletelist.add(trnewlist[0]);
     }
    }
   }
   if(trlist.size()>0 && trlist!=null)
   {
    insert trlist;
   }
   if(trdeletelist.size()>0 && trdeletelist!=null)
   {
   delete trdeletelist;
   }
   }
}