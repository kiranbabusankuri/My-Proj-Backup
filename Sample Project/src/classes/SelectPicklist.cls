public class SelectPicklist {
 public SelectPicklist(ApexPages.StandardController controller) {
 }
public String YearValue{set;get;}
public Boolean YearValue1{set;get;}
public Boolean YearValue2{set;get;}

public List<SelectOption> getYearlist () {
 List<SelectOption> options = new List<SelectOption>();
 options.add(new SelectOption('','--None--'));
 options.add(new SelectOption('1','2010'));
 options.add(new SelectOption('2','2011'));
 return options;
 }

 public void Picklist(){

 if(YearValue=='1')
 YearValue1 = true;
 else
 YearValue2 = True;
 }

 }