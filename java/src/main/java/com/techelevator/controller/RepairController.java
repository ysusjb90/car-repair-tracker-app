package com.techelevator.controller;

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

@RestController
@CrossOrigin





public class RepairController {

    private  UserDetailDao userdetailDao;
    private JdbcUserDetailDao jdbcUserDetailDao;

    public RepairController (UserDetailDao userDetailDao) {
        this.userdetailDao = userDetailDao;
    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path="/users", method = RequestMethod.POST)
    public void createDetails(@RequestBody UserDetail userDetail ){
        createDetails(userDetail);
    }








}
