public class WorkingWithApexDataTablesControllers{

 public List<ContactWrapper> allContacts { get; set; }
 public Boolean allChecked { get; set; }
 
 public WorkingWithApexDataTablesControllers () {
  allContacts = new List<ContactWrapper>();
  allChecked = false;
  
  for(Contact contact: [select Name, Title, Department, Email from Contact ]){ 
   allContacts.add(new ContactWrapper(contact));
  } 
 }
 
 public PageReference CheckAll(){
  
  for(ContactWrapper contact : allContacts){
   contact.selected = allChecked;
  }
  
  return null;
 }
 
 public PageReference ProcessSelectedContacts(){
  
  // If at least one contact has been selected,
  // forward to confrimation page
  for (ContactWrapper contactWrapper : allContacts ){
   if(contactWrapper.selected == true){
    return Page.WorkingWithApexDataTablesConfirmation;
   }
  }  
  
  // if no contacts have been selected, write an error message
  
  Apexpages.addMessage(new ApexPages.Message (ApexPages.Severity.ERROR,'No contacts selected'));
  
  return null;
 }

 public PageReference confirmSelectedContacts(){
   
  List<String> selectedContacts = new List<String>{};   

  for (ContactWrapper contactWrapper : allContacts ){
   if(contactWrapper.selected == true){
    selectedContacts.add(contactWrapper.con.Name);
   }
  }
  
  // otherwise, write a confirmation message 
  Apexpages.addMessage(new ApexPages.Message (
     ApexPages.Severity.CONFIRM, selectedContacts.size() + 
     ' contacts selected ' + selectedContacts));
  
  // If all contacts have been selected, write a warning message
  if(selectedContacts.size() == allContacts.size()){
   Apexpages.addMessage(new ApexPages.Message (
     ApexPages.Severity.WARNING, 'All contacts selected'));
  }
   
  return Page.WorkingWithApexDataTables;
 }
 
 public PageReference cancelConfirmSelectedContacts(){
   
  // If the users cancels the action at the confirmation screen, 
  // return them to the main screen with a cancellation message
  Apexpages.addMessage(new ApexPages.Message (
    ApexPages.Severity.CONFIRM, 'Action Cancelled'));   
   
  return Page.WorkingWithApexDataTables;
 }
 
 public List<Contact> getSelectedContactObjects(){
  List<Contact> selectedContactObjects = new List<Contact>{};
  
  for (ContactWrapper contactWrapper : allContacts ){
   if(contactWrapper.selected == true){
    selectedContactObjects.add(contactWrapper.con);
   }
  }
  
  return selectedContactObjects;
 }

 public class ContactWrapper {
  
  public Contact con{get; set;}
  public Boolean selected {get; set;}
        
  public ContactWrapper(Contact c){
   con = c;
   selected = false;
  }
 }
}