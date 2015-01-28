trigger india on Student__c (before insert,before update) 
{
list<Student__c> stlist = trigger.new;
for(Student__c st:stlist)
{
if(trigger.isinsert)
{
if(st.india__c != 'Indian Digital School')
{
st.india__c = 'Indian Digital School';
}
}
if(trigger.isupdate)
{
if(st.india__c!='Oxford School')
{
st.india__c = 'Oxford School 1';
}
}
}
}