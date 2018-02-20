package com.cm.auth;

import com.cm.model.dao.AuthDAO;

public class Auth {
	
	public static int isAuth;
	public static int mseq;
	private static AuthDAO dao;
	
	public Auth() {
		dao = new AuthDAO();
	}

	//MainClass�뿉�꽌 濡쒓렇�씤 �떆 �븘�씠�뵒�� 鍮꾨�踰덊샇媛� 議댁옱�븯�뒗吏� �솗�씤 �썑, 議댁옱�떆1 �뾾�쓣�떆 0 由ы꽩
	public static int check() {
		
		return 0;
	}

	//�븘�씠�뵒�� 鍮꾨�踰덊샇瑜� �씠�슜�빐�꽌 濡쒓렇�씤 �븿. �쉶�썝 踰덊샇瑜� 諛쏆븘�삩�떎.
	public static int login() {
		
		Auth.mseq = dao.getMseq();
		Auth.isAuth = dao.getAuth();
		
		return 0;
	}

}
















