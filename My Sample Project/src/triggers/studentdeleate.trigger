trigger studentdeleate on Student__c (before delete)
{
list<student__c> stlist = trigger.old;
for(student__c st:stlist)
{
st.adderror('you cannot delete this record');
}
}