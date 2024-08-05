package com.techelevator.dao;

import com.techelevator.model.UserDetails;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class JdbcUserDetailsDao implements UserDetailDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcUserDetailsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<UserDetails> getUserDetails() {
        return null;
    }

    @Override
    public UserDetails getUserType(String userType) {
        return null;
    }

    @Override
    public UserDetails getFirstName(String firstName) {
        return null;
    }

    @Override
    public UserDetails getLastName(String lastName) {
        return null;
    }

    @Override
    public UserDetails getFullName(String fullName) {
        return null;
    }

    @Override
    public UserDetails getEmailAddress(String emailAddress) {
        return null;
    }

    @Override
    public UserDetails getPhoneNumber(int phoneNumber) {
        return null;
    }

    @Override
    public UserDetails createDetails() {
        return null;
    }
}
