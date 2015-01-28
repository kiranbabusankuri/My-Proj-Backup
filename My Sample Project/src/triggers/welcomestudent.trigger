trigger welcomestudent on Student__c (before insert,before update) 
{
list<Student__c> stlist = trigger.new;
for(Student__c  st:stlist)
{
if(trigger.isinsert)
{
if(st.Welcome__c!= 'welcome to CIS')
{
st.Welcome__c ='welcome to new CIS';
}
}
if(trigger.isupdate)
{
if(st.Welcome__c!='welcome to new CIS')
{
st.Welcome__c='welcome to old CIS';
}
}
}
}