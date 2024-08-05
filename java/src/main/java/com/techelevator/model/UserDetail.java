package com.techelevator.model;

public class UserDetail {
    private Integer userId;
    private String userType;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private int phoneNumber;

    public UserDetail() {}

    public UserDetail
            (Integer userId, String userType, String firstName, String lastName,
             String emailAddress, int phoneNumber) {

        this.userId = userId;
        this.userType = userType;
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress=emailAddress;
        this.phoneNumber=phoneNumber;

    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserType(){
        return userType;
    }

    public String getFirstName(){
        return  firstName;
    }

    public String getLastName(){
        return lastName;
    }

    public String getFullName(){
        return firstName + " " + lastName;
    }

    public String getEmailAddress(){
        return emailAddress;
    }

    public int getPhoneNumber(){
        return phoneNumber;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "UserDetails{" +
                "userType='" + userType + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", emailAddress='" + emailAddress + '\'' +
                ", phoneNumber=" + phoneNumber +
                '}';
    }


}
