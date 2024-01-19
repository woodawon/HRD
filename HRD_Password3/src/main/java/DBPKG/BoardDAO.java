package DBPKG;

import java.util.ArrayList;

import javax.servlet.ServletContext;

public class BoardDAO extends JDBConnect {
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int addSell(BoardDTO dto) {
		int result = 0;
		try {
			String query = "insert into \"salelist\"(saleno, pcode, saledate, scode, amount) values(?,?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getSaleno());
			psmt.setString(2, dto.getPcode());
			psmt.setString(3, dto.getSaledate());
			psmt.setString(4, dto.getScode());
			psmt.setInt(5, dto.getAmount());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<BoardDTO> searchSell() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"salelist\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSaleno(rs.getInt("saleno"));
				dto.setPcode(rs.getString("pcode"));
				dto.setSaledate(rs.getDate("saledate").toString());
				dto.setScode(rs.getString("scode"));
				dto.setAmount(rs.getInt("amount"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<BoardDTO> searchPrice() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"product\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setPcode(rs.getString("pcode"));
				dto.setName(rs.getString("name"));
				dto.setCost(rs.getInt("cost"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<BoardDTO> searchShop() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"shop\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setScode(rs.getString("scode"));
				dto.setSname(rs.getString("sname"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
