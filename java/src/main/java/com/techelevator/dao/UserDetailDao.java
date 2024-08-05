package com.techelevator.dao;

import com.techelevator.model.UserDetails;

import java.util.List;

public interface UserDetailDao {

    List<UserDetails> getUserDetails();
    UserDetails getUserType(String userType);

    UserDetails getFirstName(String firstName);

    UserDetails getLastName(String lastName);

    UserDetails getFullName(String fullName);

    UserDetails getEmailAddress(String emailAddress);

    UserDetails getPhoneNumber(int phoneNumber);

    UserDetails createDetails();
}
