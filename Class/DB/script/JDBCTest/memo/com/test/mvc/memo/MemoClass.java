package com.test.mvc.memo;

import com.test.mvc.memo.model.MemoDAO;
import com.test.mvc.memo.view.MemoView;

public class MemoClass {

	private MemoDAO dao;
	private MemoView view;
	
	public MemoClass() {
		
		dao = new MemoDAO();
		view = new MemoView();
	}

	public void start() {
		
		view.menu();
	}
}
