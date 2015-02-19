trigger update_manager on student__c(before insert,before update)
{
set<id> set1 = new set<id>();
map<id,string> map1 = new map<id,string>();
list<user> ulist = new list<user>();
if(trigger.isbefore)
{
if(trigger.isinsert || trigger.isupdate)
{
for(student__c st:trigger.new)
{
set1.add(st.ownerid);
}
if(set1.size()>0 && set1!=null)
{
ulist = [select id,name from user where id in:set1];
for(user u:ulist)
{
map1.put(u.id,u.name);
}
}
if(map1.size()>0 && map1!=null)
{
for(student__c st:trigger.new)
{
st.manager__c = map1.get(st.ownerid);
}
}
}
}
}