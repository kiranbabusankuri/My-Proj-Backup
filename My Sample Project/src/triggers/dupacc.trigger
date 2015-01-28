trigger dupacc on Account(before insert,before update)
{
for(account acc:trigger.new)
{
list<account> acclist=[select id from account where name=:acc.name];
if(acclist.size()>0)
{
acc.addError('you cannot create the duplicate account');
}
}
}