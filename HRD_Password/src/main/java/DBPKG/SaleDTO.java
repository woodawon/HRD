package DBPKG;

public class SaleDTO {
	private int custno;
	private int sale;
	private String name;
	private String grade;
	
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	
	public int getSale() {
		return sale;
	}
	
	public void setSale(int sale) {
		this.sale = sale;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getGrade() {
		return grade;
	}
	
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}
