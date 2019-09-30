package org.smartweb.day6;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {

	public TodoDTO(String title, Date dueDate) {
		this.title=title;
		this.dueDate=new Date();
	}
	
	private String title;
	
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date dueDate;
	
}
