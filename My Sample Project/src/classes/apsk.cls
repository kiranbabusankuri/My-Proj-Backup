@istest

public class apsk {

    public String Status { get; set; }
    
    public string uid {set;get;}
    public string pwd {set;get;}
    public string stat{set;get;}
    
    public void m1(){
        
        if ( (uid == 'harsh') && (pwd == 'cloud') )
            status = 'Valid User';
        else
            stat = 'Your Not a valid user';
            
    }

}