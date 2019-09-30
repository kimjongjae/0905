package org.smartweb.day6.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;
	private Long bno;
	
	private String replytext;
	private String replyer;
	//@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd [HH:mm:ss]", timezone="Asia/Seoul")
	private Date regdate;
	private Date updateDate;
	
}
