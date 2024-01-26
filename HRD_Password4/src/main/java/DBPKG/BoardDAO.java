package DBPKG;

import java.util.ArrayList;

import javax.servlet.ServletContext;

public class BoardDAO extends JDBConnect {
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public ArrayList<BoardDTO> searchPatient() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"patient\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setPno(rs.getString("p_no"));
				dto.setPname(rs.getString("p_name"));
				dto.setPbirth(rs.getString("p_birth"));
				dto.setPgender(rs.getString("p_gender"));
				dto.setPtel1(rs.getString("p_tel1"));
				dto.setPtel2(rs.getString("p_tel2"));
				dto.setPtel3(rs.getString("p_tel3"));
				dto.setPcity(rs.getString("p_city"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<BoardDTO> searchResult() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"result\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setPno(rs.getString("p_no"));
				dto.setTcode(rs.getString("t_code"));
				dto.setTsdate(rs.getString("t_sdate"));
				dto.setTstatus(rs.getString("t_status"));
				dto.setTldate(rs.getString("t_ldate"));
				dto.setTresult(rs.getString("t_result"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<BoardDTO> searchLabTest() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"labTest\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setTcode(rs.getString("t_code"));
				dto.setTname(rs.getString("t_name"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int addTestResult(BoardDTO dto) {
		int result = 0;
		try {
			String query = "insert into \"result\"(p_no, t_code, t_sdate, t_status, t_ldate, t_result) values(?,?,?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getPno());
			psmt.setString(2, dto.getTcode());
			psmt.setString(3, dto.getTsdate());
			psmt.setString(4, dto.getTstatus());
			psmt.setString(5, dto.getTldate());
			psmt.setString(6, dto.getTresult());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
