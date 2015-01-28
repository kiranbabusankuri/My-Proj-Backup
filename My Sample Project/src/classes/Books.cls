public class Books
{
public void applydiscount(list<Book__c> books)
{
for(Book__c b:books)
{
b.price__c*=0.9;
}
}
}