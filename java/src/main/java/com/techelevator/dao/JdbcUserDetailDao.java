package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.User;
import com.techelevator.model.UserDetail;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository
public class JdbcUserDetailDao implements UserDetailDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcUserDetailDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<UserDetail> getUserDetails() {
        List<UserDetail> userDetailList = new ArrayList<>();
        String sql = "SELECT user_id, user_type, first_name, last_name, email_address, phone_number FROM user_detail";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                UserDetail userDetail = mapRowToUser(results);
                userDetailList.add(userDetail);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return userDetailList;

    }

    @Override
    public UserDetail getUserType(String userType) {
        return null;
    }

    @Override
    public UserDetail getFirstName(String firstName) {
        return null;
    }

    @Override
    public UserDetail getLastName(String lastName) {
        return null;
    }

    @Override
    public UserDetail getFullName(String fullName) {
        return null;
    }

    @Override
    public UserDetail getEmailAddress(String emailAddress) {
        return null;
    }

    @Override
    public UserDetail getPhoneNumber(int phoneNumber) {
        return null;
    }
//TODO does method below need to have a RETURNING statement and loop?
    @Override
    public UserDetail createDetails(UserDetail userDetail) {
        UserDetail newDetails = null;

        String sql = "INSERT INTO user_detail(user_id, user_type, first_name, last_name, email_address, phone_number)  VALUES (?,?,?,?,?,?);";


        SqlRowSet newDetailRows = jdbcTemplate.queryForRowSet(sql, userDetail.getUserType(),
                userDetail.getFirstName(), userDetail.getLastName(), userDetail.getEmailAddress(), userDetail.getPhoneNumber());

        return newDetails;

    }

    public UserDetail mapRowToUser(SqlRowSet rs) {
        UserDetail userDetail = new UserDetail();
        userDetail.setUserType(rs.getString("userType"));
        userDetail.setFirstName(rs.getString("firstName"));
        userDetail.setLastName((rs.getString("lsatName")));
        userDetail.setEmailAddress(rs.getString("emailAddress"));
        userDetail.setPhoneNumber(rs.getInt("phoneNumber"));
        return userDetail;
    }






}
