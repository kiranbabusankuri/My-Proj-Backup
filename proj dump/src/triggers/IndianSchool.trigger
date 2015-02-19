trigger IndianSchool on Student__c (before insert,before update)
{
list<student__c> stlist =trigger.new;
for(student__c st:stlist)
{
if(trigger.isinsert)
{
if(st.welcome__c!='Welcome to indian school')
{
  st.welcome__c = 'Wel come students';
  }
  }
if(trigger.isupdate)
{
if(st.welcome__c!='Welcome to Oxford school')
{
  st.welcome__c ='Welcome to Oxford school';
  }
  }
  }
  }