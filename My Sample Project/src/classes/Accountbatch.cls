global class Accountbatch implements Database.batchable<SObject>
{
   global Database.QueryLocator start(Database.batchableContext info){
       String query;
       query = ('SELECT Id,name FROM account where createddate >= TODAY' );
       system.debug('+++++++++++++'+query );
    
       return Database.getQueryLocator(query); /* <-- error throwing here in error message */
   }   
   global void execute(Database.batchableContext info, List<account> acc) {
       delete acc;
   }   
   global void finish(Database.batchableContext info)
   {
   
   }
}