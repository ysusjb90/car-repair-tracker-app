package com.techelevator.controller;

import com.techelevator.dao.JdbcRepairDAO;
import com.techelevator.dao.JdbcUserDetailDao;
import com.techelevator.dao.UserDetailDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.*;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import com.techelevator.dao.UserDao;
import com.techelevator.security.jwt.JWTFilter;
import com.techelevator.security.jwt.TokenProvider;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin

public class RepairController {

    private  UserDetailDao userDetailDao;
    private JdbcUserDetailDao jdbcUserDetailDao;
    private JdbcRepairDAO jdbcRepairDAO;


    public RepairController (UserDetailDao userDetailDao) {
        this.userDetailDao = userDetailDao;
    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path="/users", method = RequestMethod.POST)
    public void createDetails(@RequestBody UserDetail userDetail ){
        createDetails(userDetail);
    }

    @RequestMapping(path="/repairs", method = RequestMethod.GET)
    public List<Repair> getRepairItemsList(){
        List<Repair> allRepairs=new ArrayList<>();
        getRepairItemsList();
        return allRepairs;
    }
//TODO This is returning NULL - it didn't take the variable used in teh jdbc DAO?







}
