public class pg {

 public contact contactRec {get;set;}
 
    public pg() {
    
        contactRec = new contact();
        cont= new list<contact>();
    }
    public list<contact> cont { 
    get {
        cont=[select id, firstname, lastname , email,phone,accountid from contact where accountid =:contactRec.accountid];
        return cont;
    } 
    set; 
    }
    public list<opportunity> oppty{ 
        get{
            oppty=[select name, amount from opportunity where accountid=:contactRec.accountid];
            return oppty;
        } 
        set; 
    }
    }