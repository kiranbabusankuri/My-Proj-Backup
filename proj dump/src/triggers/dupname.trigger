trigger dupname on student__c (before insert, before update) {
for(student__c st:trigger.new)
{
list<student__c>st_list=[select id,name from student__c where Name=:st.Name];
if(st_list.size()>0 && st.Name!=null)
{
st.adderror('you cannot insert or update operation on dup names');
}
}
}