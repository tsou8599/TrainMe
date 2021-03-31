package _09_trainerCourse.model;

public class RatingsAvgBean_H {
	
	Integer tr_id; 
	Double avg_point;
	
	public RatingsAvgBean_H(Integer tr_id, Double avg_point) {
		this.tr_id = tr_id;
		this.avg_point = avg_point;
	}
	public RatingsAvgBean_H() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getTr_id() {
		return tr_id;
	}
	public void setTr_id(Integer tr_id) {
		this.tr_id = tr_id;
	}
	public Double getAvg_point() {
		return avg_point;
	}
	public void setAvg_point(Double avg_point) {
		this.avg_point = avg_point;
	}


}