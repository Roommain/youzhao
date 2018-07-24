package com.workweb;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by L on 2018/7/23.
 */
public class RecruitDao {

    private static RecruitDao instance = new RecruitDao();

    public static RecruitDao getInstance() {
        return instance;
    }

    public List<Recruit> selectAllDesc() throws SQLException {
        String goodsql = "select id,companyName,treatment,describe,requirement,interviewDate,place,phone,endDate,workplace, username,publisher,systemTime from CQUPT_RECRUIT order by id desc";
        ResultSet rs = Jdbcconn.getInstance().executeQuery(goodsql);
        ArrayList<Recruit> result = new ArrayList<>();
        while(rs.next()) {
            Recruit e = new Recruit();
            e.setId(rs.getInt("id"));
            e.setCompanyName(rs.getString("companyName"));
            e.setDescribe(rs.getString("describe"));
            e.setRequirement(rs.getString("requirement"));
            e.setPlace(rs.getString("place"));
            e.setSystemTime(rs.getString("systemTime"));
            e.setTreatment(rs.getString("treatment"));

            e.setInterviewDate(rs.getString("interviewDate"));
            String[] arr = e.getInterviewDate().split(" ");
            e.setInter(arr[0]);

            e.setPhone(rs.getString("phone"));

            e.setEndDate(rs.getString("endDate"));
            String[] arr2 = e.getEndDate().split(" ");
            e.setEndD(arr2[0]);

            e.setWorkplace(rs.getString("workplace"));
            e.setUsername(rs.getString("username"));
            e.setPublisher(rs.getString("publisher"));
            result.add(e);
        }

        return result;
    }

}
