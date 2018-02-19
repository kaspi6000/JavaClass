package com.cm.auth;

import com.cm.model.dao.AuthDAO;

public class Auth {
	
	public static int isAuth;
	public static int mseq;
	private AuthDAO dao;
	
	public Auth() {
		dao = new AuthDAO();
	}

	//MainClass에서 로그인 시 아이디와 비밀번호가 존재하는지 확인 후, 존재시1 없을시 0 리턴
	public int check() {
		
		return 0;
	}

	//아이디와 비밀번호를 이용해서 로그인 함. 회원 번호를 받아온다.
	public int login() {
		
		Auth.mseq = dao.getMseq();
		Auth.isAuth = dao.getAuth();
		
		return 0;
	}

}
















