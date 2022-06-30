package com.oracle.S20220604.domain;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class Chatting {

	private int 	room_num;
	private String  room_name;
	private int 	room_type;
	private String 	room_pawd;
	private String	pic_change;
	
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
	private String user_id;
	private int room_type2; //판매자채팅 타입
}
