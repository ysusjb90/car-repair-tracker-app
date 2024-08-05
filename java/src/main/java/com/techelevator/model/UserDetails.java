package com.techelevator.model;

public class UserDetails {

    private String userType;
    private String firstName;
    private String lastName;
    private String emailAddress;
    private int phoneNumber;

    public UserDetails() {}

    public UserDetails
            (String userType, String firstName, String lastName,
             String emailAddress, int phoneNumber) {

        this.userType = userType;
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailAddress=emailAddress;
        this.phoneNumber=phoneNumber;

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
