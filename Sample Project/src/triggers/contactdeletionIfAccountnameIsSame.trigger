trigger contactdeletionIfAccountnameIsSame on Account (before insert,before delete) { 
    list<string> myname = new list<string>();
    for(account a:trigger.new)
    {
        myname.add(a.name);
        
    }
    list<contact> mycon=[select id, name from contact where lastname in:myname];
    delete mycon;
    }