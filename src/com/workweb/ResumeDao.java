package com.workweb;
import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResumeDao extends HttpServlet {
    private static ResumeDao instance = new ResumeDao();
    public static ResumeDao getInstance() {
        return instance;
    }
    public List<ResumeJavabean> selectById(String id) throws SQLException {
        String resSql = "select * from cqupt_resume where ID=?";
        Connection connection = Jdbcconn.getInstance().getConn();
        PreparedStatement statement = connection.prepareStatement(resSql);
        statement.setString(1, id);
        ResultSet rs = statement.executeQuery();
        ArrayList<ResumeJavabean> resumeJavabeans = new ArrayList<>();
        while(rs.next()) {
            ResumeJavabean e = fromResultSet(rs);
            resumeJavabeans.add(e);
        }
        return resumeJavabeans;
    }
    public List<ResumeJavabean> resumeAllDesc(String username) throws SQLException {
//        String resSql = "select * from cqupt_resume where username=?";
        String resSql = "select cqupt_resume.id,\n" +
                "       cqupt_resume.realname,\n" +
                "       cqupt_resume.phone,\n" +
                "       cqupt_resume.email,\n" +
                "       cqupt_resume.skill,\n" +
                "       cqupt_resume.school,\n" +
                "       cqupt_resume.major,\n" +
                "       cqupt_resume.enddate,\n" +
                "       cqupt_resume.award,\n" +
                "       cqupt_resume.project,\n" +
                "       cqupt_resume.campusexperience,\n" +
                "       cqupt_resume.systemtime,\n" +
                "       cqupt_resume.username,\n" +
                "       cqupt_resume.education,\n" +
                "       cqupt_resume.recruitid from cqupt_recruit,cqupt_resume where cqupt_resume.recruitid=cqupt_recruit.id and cqupt_recruit.username=?\n";
        Connection connection = Jdbcconn.getInstance().getConn();
        PreparedStatement statement = connection.prepareStatement(resSql);
        statement.setString(1, username);
        ResultSet rs = statement.executeQuery();
        ArrayList<ResumeJavabean> resumeJavabeans = new ArrayList<>();
        while(rs.next()) {
            ResumeJavabean e = fromResultSet(rs);
            resumeJavabeans.add(e);
        }
        return resumeJavabeans;
    }


    private ResumeJavabean fromResultSet(ResultSet rs) throws SQLException {
        ResumeJavabean e = new ResumeJavabean();

        e.setId(rs.getInt("id"));
        e.setRealName(rs.getString("realName"));
        e.setPhone(rs.getString("phone"));
        e.setEmail(rs.getString("email"));
        e.setSkill(rs.getString("skill"));
        e.setSchool(rs.getString("school"));
        e.setMaxEducation(rs.getString("Education"));

        e.setEndDate(rs.getString("endDate"));
        String[] arr = e.getEndDate().split(" ");
        e.setEndDa(arr[0]);

        e.setMajor(rs.getString("major"));
        e.setProject(rs.getString("project"));
        e.setAward(rs.getString("award"));
        e.setCompusExperise(rs.getString("campusexperience"));

        return e;

    }
}
