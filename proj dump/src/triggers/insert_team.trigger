trigger insert_team on Opportunity(after insert)
{
list<opportunityteammember> opplist = new list<opportunityteammember>();
for(opportunity opp:trigger.new)
{
opportunityteammember opt  = new opportunityteammember();
opt.opportunityid=opp.id;
opt.userid =opp.ownerid;
opt.teammemberrole = 'sales manager';
opplist.add(opt);
}
if(opplist.size()>0 && opplist!=null)
{
insert opplist;
}
}