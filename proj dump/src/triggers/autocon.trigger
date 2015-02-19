trigger autocon on account(after insert,after update)
{
list<contact> conlist=new list<contact>();
list<opportunity> opplist = new list<opportunity>();
map<id,decimal> map1=new map<id,decimal>();
map<id,decimal> map2=new map<id,decimal>();
for(account acc:trigger.new)
{
map1.put(acc.id,acc.number_of_contacts__c);
map2.put(acc.id,acc.number_of_opportunity__c);
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
con.email = 'tcs@capital.com';
conlist.add(con);
}
}
}
if(conlist.size()>0 && conlist!=null)
{
insert conlist;
}
if(map2.size()>0 && map2!=null)
{
for(id abc:map2.keyset())
{
for(integer j=0;j<map2.get(abc);j++)
{
opportunity opp = new opportunity();
opp.name='opportunity'+j;
opp.StageName = 'Prospecting';
opp.accountid = abc;
opp.CloseDate = Date.Parse('5/22/2014');
opplist.add(opp);
}
}
}
if(opplist.size()>0 && opplist!=null)
{
insert opplist;
}
}