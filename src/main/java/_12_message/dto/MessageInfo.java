package _12_message.dto;

import java.sql.Date;

import _12_message.model.MessageBean;

public class MessageInfo {
	
	private Integer id;
	private Date date;
	private String title;
	private String content;
	private Integer is_read;
	private Integer toType;
	private String kind;
	
	private MessageInfo(Integer id, Date date, String title, String content, Integer is_read, Integer toType, String kind) {
		super();
		this.id = id;
		this.date = date;
		this.title = title;
		this.content = content;
		this.is_read = is_read;
		this.toType = toType;
		this.kind = kind;
	}
	
	public static MessageInfo create(MessageBean mb) {
		return new MessageInfo(mb.getId(), mb.getDate(), mb.getTitle()
				, mb.getContent(), mb.getIs_read(), mb.getToType(), mb.getKind());
	}
	
	
	
	

}
