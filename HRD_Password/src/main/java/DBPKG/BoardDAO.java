package DBPKG;

import java.util.ArrayList;

import javax.servlet.ServletContext;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}

	public int insertReview(BoardDTO dto) {
		int result = 0;

		try {
			String query = "insert into \"member\" (" + "custno, custname, phone, address, joindate, grade, city)"
					+ "values (?,?,?,?,?,?,?)";
			psmt = con.prepareStatement(query); // 동적 쿼리
			psmt.setInt(1, dto.getCustno());
			psmt.setString(2, dto.getCustname());
			psmt.setString(3, dto.getPhone());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getJoindate());
			psmt.setString(6, dto.getGrade());
			psmt.setString(7, dto.getCity());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	public ArrayList<BoardDTO> selectUser() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"member\" order by custno";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getString("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int EditUser(String num, BoardDTO dto) {
		int result = 0;
		try {
			String query = "update \"member\" set custno=?, custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getCustno());
			psmt.setString(2, dto.getCustname());
			psmt.setString(3, dto.getPhone());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getJoindate());
			psmt.setString(6, dto.getGrade());
			psmt.setString(7, dto.getCity());
			psmt.setString(8, num);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<BoardDTO> selectSales() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"money\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setSalenol(rs.getInt("salenol"));
				dto.setPcost(rs.getInt("pcost"));
				dto.setAmount(rs.getInt("amount"));
				dto.setPrice(rs.getInt("price"));
				dto.setPcode(rs.getString("pcode"));
				dto.setSdate(rs.getString("sdate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
