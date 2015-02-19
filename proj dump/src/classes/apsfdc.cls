public class apsfdc {
  
      
    public string uid {set;get;}
    public string pwd {set;get;}
    public string stat {set;get;}
    
    public void m1(){
        
        if ( (uid == 'harsh') && (pwd == 'cloud') )
            stat = 'Valid User';
        else
            stat = 'Invalid User';
            
            if ( (uid == 'kiran') && (pwd == 'cloud') )
            stat = 'Valid User';
        else
            stat = 'Invalid User';
    }
    }