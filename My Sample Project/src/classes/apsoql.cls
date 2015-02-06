public class apsoql {
    public string aname {set;get;}
    public string aphone {set;get;}
    public string acity {set;get;}
    
    public list<account> arecs {set;get;}
integer i;
    public void mi(){
        
     integer n =  [select count() from account where name = :aname];
        
        if( n == 0 ){   
        account ac = new account();
            ac.name = aname;
            ac.phone = aphone;
            ac.BillingCity = acity;
        
        insert ac;
        
        apexpages.Message msg1 = new apexpages.Message
              (apexpages.Severity.CONFIRM, aname + ' Record inserted Successfully ');
        apexpages.addMessage(msg1);
        
       
        } // true block
        else {
       apexpages.Message msg2 = new apexpages.Message
               (apexpages.Severity.ERROR, n + ' Records already exist');     
       apexpages.addMessage(msg2)     ;
        }
        
    arecs = [select id,name,phone,billingcity, createddate
                from account
                where name =: aname  ];            
    }
    
    public void md(){
        
        list<account> ls = [select id,name from account where name = :aname];
        delete ls;

        apexpages.Message msg2 = new apexpages.Message
               (apexpages.Severity.INFO, ls.size() + ' Records DELETED Succcessfully ');     
       apexpages.addMessage(msg2)     ;

    arecs = [select id,name,phone,billingcity, createddate
                from account
                where name =: aname  ];            
    }
    
    public void mu(){
    
       list<account> ls = [select id,name from account where name = :aname];
        
         for(account ac : ls)
         {
            if ( i == ls.size()){
                ac.Phone = aphone;
                ac.BillingCity = acity;
              update ac;
                break;    // moves control outside the for loop
            }
          i++;
        }

        apexpages.Message msg1 = new apexpages.Message
               (apexpages.Severity.WARNING, ls.size() + ' Records UPDATED Succcessfully ');     
       apexpages.addMessage(msg1)     ;

    arecs = [select id,name,phone,billingcity, createddate
                from account
                where name =: aname  ];            
    }
    
    
    
}