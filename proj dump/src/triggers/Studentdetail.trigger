trigger Studentdetail on Student__c (before insert) 
{
list<student__c> stlist = trigger.new;
for(student__c st:stlist)
{
if(st.gender__c=='male')
{
  st.name='mr.'+st.name;
  }
  if(st.gender__c=='female')
  {
  st.name='miss.'+st.name;
  }
  }
  }