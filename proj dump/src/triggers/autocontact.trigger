trigger autocontact on account(after insert,after update)
{
list<contact> conlist=new list<contact>();
map<id,decimal> map1=new map<id,decimal>();
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