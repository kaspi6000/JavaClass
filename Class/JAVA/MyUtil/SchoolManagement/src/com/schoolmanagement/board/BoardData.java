package com.schoolmanagement.board;

public class BoardData {
	
	private String title;
	private String num;
	private String author;
	private String content;
	private String boardPwd;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String strings) {
		this.title = strings;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBoardPwd() {
		return boardPwd;
	}
	public void setBoardPwd(String boardPwd) {
		this.boardPwd = boardPwd;
	}
	
	@Override
	public String toString() {
	
		return String.format("%s. %s", this.num, this.title);
	}
}