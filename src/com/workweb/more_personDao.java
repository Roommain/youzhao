package com.workweb;
import javax.servlet.annotation.WebServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/more_person")
public class more_personDao{
    private static more_personDao instance = new more_personDao();
    public static more_personDao getInstance() {
        return instance;
    }
    public List<more_person> selectAll(String username) throws SQLException{
        String goodsql="select * from CQUPT_RESUME,cqupt_recruit where cqupt_recruit.id=cqupt_resume.recruitid and cqupt_resume.username=? order by cqupt_resume.systemtime desc";
        Connection connection = Jdbcconn.getInstance().getConn();
        PreparedStatement statement = connection.prepareStatement(goodsql);
        statement.setString(1, username);
        ResultSet rs = statement.executeQuery();
        ArrayList<more_person> result=new ArrayList<>();
        while (rs.next()){
            more_person e = fromResultSet(rs);
            result.add(e);
        }
        return result;
    }
    public List<more_person> selectAllId(String id) throws SQLException{
        String goodsql = "select * from CQUPT_RESUME,cqupt_recruit where cqupt_recruit.id=cqupt_resume.recruitid and cqupt_resume.id=?";
        Connection connection = Jdbcconn.getInstance().getConn();
        PreparedStatement statement = connection.prepareStatement(goodsql);
        statement.setString(1, id);
        ResultSet rs = statement.executeQuery();
        ArrayList<more_person> result=new ArrayList<>();
        while (rs.next()){
            more_person e = fromResultSet(rs);
            result.add(e);
        }
        return result;
    }
    private more_person fromResultSet(ResultSet rs) throws SQLException {
        more_person e=new more_person();
        e.setId(rs.getInt("id"));
        e.setReealname(rs.getString("realname"));
        e.setPhone(rs.getString("phone"));
        e.setEmail(rs.getString("email"));
        e.setSkill(rs.getString("skill"));
        e.setSchool(rs.getString("school"));
        e.setMajor(rs.getString("major"));
        e.setEnddate(rs.getString("enddate"));
        e.setProject(rs.getString("project"));
        e.setCompany(rs.getString("companyname"));
        String[] arr=e.getEnddate().split(" ");
        e.setInter(arr[0]);
        e.setAward(rs.getString("award"));
        e.setCampusexperience(rs.getString("campusexperience"));
        e.setSysemtime(rs.getString("systemtime"));
        e.setUsername(rs.getString("username"));
        e.setEducation(rs.getString("education"));
        e.setRecruitid(rs.getString("recruitid"));
        return e;
    }
}
