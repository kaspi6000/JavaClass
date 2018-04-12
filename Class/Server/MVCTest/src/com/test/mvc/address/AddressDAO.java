package com.test.mvc.address;

import java.sql.*;
import java.util.ArrayList;

public class AddressDAO {
	
	private Connection conn;
	private PreparedStatement stat;
	private ResultSet rs;
	
	public AddressDAO() {
		
		try {
			
			conn = DBUtil.open();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// AddOk 서블릿이 dto를 주면서 insert 해달라고 요청(위임)
	public int add(AddressDTO dto) {
		
		try {
			
			String sql = "INSERT INTO tblAddress (seq, name, age, gender, tel, address) VALUES(address_seq.nextval, ?, ?, ?, ?, ?)";
			
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, dto.getName());
			stat.setString(2, dto.getAge());
			stat.setString(3, dto.getGender());
			stat.setString(4, dto.getTel());
			stat.setString(5, dto.getAddress());
			
			return stat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<AddressDTO> list() {
		
		try {
			
			String sql = "SELECT * FROM tblAddress";
			
			stat = conn.prepareStatement(sql);
			
			rs = stat.executeQuery();
			
			// rs -> list 복사
			ArrayList<AddressDTO> list = new ArrayList<AddressDTO>();
			while (rs.next()) {
				
				// 1회전 -> 레코드 1개 -> AddressDTO 1개
				
				AddressDTO dto = new AddressDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);
			}
			
			return list; // 컨트롤러에게 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
