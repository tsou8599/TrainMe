package _04_money.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import _01_register.model.MemberBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;



/**
 * @author ali82
 *
 */
@Entity
@Table(name="trainer_account")
public class TrainerAccountBean_H extends MemberBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	private Date time;
	private Integer total_amount;
	private String note;
	@Transient
	List<TrainerAccountBean_H> items = new ArrayList<>();
	
	
	public TrainerAccountBean_H() {
		
	};
	
	public TrainerAccountBean_H(Integer id, TrainerBean_H trainerBean_H, Date time, Integer total_amount, String note,
			List<TrainerAccountBean_H> items) {
		super();
		this.id = id;
		this.trainerBean_H = trainerBean_H;
		this.time = time;
		this.total_amount = total_amount;
		this.note = note;
		this.items = items;
	}


	public List<TrainerAccountBean_H> getItems() {
		return items;
	}


	public void setItems(List<TrainerAccountBean_H> items) {
		this.items = items;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TrainerBean_H getTrainerBean_H() {
		return trainerBean_H;
	}

	public void setTrainerBean_H(TrainerBean_H trainerBean_H) {
		this.trainerBean_H = trainerBean_H;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(Integer total_amount) {
		this.total_amount = total_amount;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	


}