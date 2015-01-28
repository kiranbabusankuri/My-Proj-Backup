trigger dupaccountname on Account(before insert,before update)
{
for(Account acc:trigger.new)
{ 
list<Account> alist =[select id,name from account where name=:acc.name];
if(alist.size()>0)
{
  acc.addError('you cant create duplicate account');
 }
 }
}