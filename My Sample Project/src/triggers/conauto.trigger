trigger conauto on account(after insert, after update)
{
list<contact> conlist =new list<contact>();                
map<id,decimal> map1=new map<id,decimal>();
list<contact> connewlist = new list<contact>();
list<contact> condeletelist = new list<contact>();
if(trigger.isinsert)
{
for(account acc:trigger.new)
{
map1.put(acc.id,acc.number_of_contacts__c);
}
if(map1.size()>0 && map1!=null)
{
for(id abc:map1.keyset())
{
for(integer i=0;i<map1.get(abc);i++)
{
contact con =new contact();
con.lastname='contact'+i;
con.title = 'manager';
con.accountid = abc;
con.email = 'shm@capital.com';
conlist.add(con);
}
}
}
if(conlist.size()>0 && conlist!=null)
{
insert conlist;
}
}
if(trigger.isupdate)
{
for(account acc:trigger.new)
{
map1.put(acc.id,acc.number_of_contacts__c);
}
if(map1.size()>0 && map1!=null)
{
for(id abc:map1.keyset())
{
connewlist=[select id,name from contact where accountid=:abc];
if(map1.get(abc)>connewlist.size())
{
for(integer i=0;i<map1.get(abc)-connewlist.size();i++)
{
contact con=new contact();
con.lastname='contact'+i;
con.title ='manager';
con.accountid=abc;
conlist.add(con);
}
}
if(connewlist.size()>map1.get(abc))
{
for(integer i=0;i<connewlist.size()-map1.get(abc);i++)
{
condeletelist.add(connewlist[i]);
}
}
}
}
if(conlist.size()>0 && conlist!=null)
{
   insert conlist;
   }
if(condeletelist.size()>0 && condeletelist!=null)
{
delete condeletelist;
}
}
}