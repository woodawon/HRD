package DBPKG;

import java.util.ArrayList;

import javax.servlet.ServletContext;

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public ArrayList<BoardDTO> selectStudent() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"member\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setGrade(rs.getInt("grade"));
				dto.setClasses(rs.getInt("classes"));
				dto.setNum(rs.getInt("num"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("학생정보 조회 중 예외 발생");
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<BoardDTO> selectScore() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "select * from \"score\"";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setKorean(rs.getInt("korean"));
				dto.setEnglish(rs.getInt("english"));
				dto.setMath(rs.getInt("math"));
				dto.setHistory(rs.getInt("history"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("학생성적 조회 중 예외 발생");
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertStudent(BoardDTO dto) {
		int result = 0;

		try {
			String query = "insert into \"score\" (" + "id, korean, english, math, history)"
					+ " values (?,?,?,?,?)";
			psmt = con.prepareStatement(query); // 동적 쿼리
			psmt.setString(1, dto.getId());
			psmt.setInt(2, dto.getKorean());
			psmt.setInt(3, dto.getEnglish());
			psmt.setInt(4, dto.getMath());
			psmt.setInt(5, dto.getHistory());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("입력 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}
}
