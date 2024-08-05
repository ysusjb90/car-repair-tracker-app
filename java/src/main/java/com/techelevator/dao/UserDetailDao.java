package com.techelevator.dao;

import com.techelevator.model.UserDetail;

import java.util.List;

public interface UserDetailDao {

    List<UserDetail> getUserDetails();
    UserDetail getUserType(String userType);

    UserDetail getFirstName(String firstName);

    UserDetail getLastName(String lastName);

    UserDetail getFullName(String fullName);

    UserDetail getEmailAddress(String emailAddress);

    UserDetail getPhoneNumber(int phoneNumber);

    UserDetail createDetails(UserDetail userDetail);
}
