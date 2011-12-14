package beans;
public class Basket implements java.io.Serializable {
 
    private String cafeamount;
    private String sugaramount;
	private String wateramount;		
    
    public Basket(){}	
	/////////////Setters & Getters////////////
	public String getCafeamount() {
        return this.cafeamount;
    }
    public void setCafeamount(final String cafeamount) {
		this.cafeamount= cafeamount;
    }	
    public String getSugaramount() {
        return this.sugaramount;
    }
    public void setSugaramount(final String sugaramount) {
	this.sugaramount =sugaramount;
    }
    public String getWateramount() {
        return this.wateramount;
    }
    public void setWateramount(final String wateramount) {
	this.wateramount =wateramount;
    }
}