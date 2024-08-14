package com.techelevator.controller;

import com.techelevator.dao.*;
import com.techelevator.exception.DaoException;
import com.techelevator.model.*;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import com.techelevator.dao.VehicleDAO;
import com.techelevator.dao.UserDao;

import com.techelevator.security.jwt.JWTFilter;
import com.techelevator.security.jwt.TokenProvider;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")

public class RepairController {

    private UserDetailDao userDetailDao;

    private RepairDao repairDao;
    private UserDao userDao;
    private EstimateDAO estimateDAO;

    private VehicleDAO vehicleDAO;


    public RepairController(UserDetailDao userDetailDao,
                            RepairDao repairDao, UserDao userDao, EstimateDAO estimateDAO,
                            VehicleDAO vehicleDAO) {
        this.userDetailDao = userDetailDao;
        this.repairDao = repairDao;
        this.userDao = userDao;
        this.estimateDAO = estimateDAO;
        this.vehicleDAO = vehicleDAO;
    }


    @RequestMapping(path = "/repairs", method = RequestMethod.GET)
    public List<Repair> deliverRepairList() {
        return repairDao.getRepairItemsList();
        // List<Repair> allRepairs = new ArrayList<>();

    }


    @RequestMapping(path = "/estimates", method = RequestMethod.POST)
    public void createNewEstimate(@RequestBody Estimate estimate, Principal principal) {
        User user = userDao.getUserByUsername(principal.getName());
        estimateDAO.createEstimate(estimate, user.getId());
    }

    @RequestMapping(path = "/estimates", method = RequestMethod.GET)
    public List<Estimate> listOfEstimates() {
        return estimateDAO.getListOfEstimates();
    }

// TODO need to add an endpoint for estimate using param /{id}




    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/repairs/{repairItemId}", method = RequestMethod.POST)
    public void addRepairToEstimate(@PathVariable int repairItemId, int estimateId) {
        estimateDAO.addRepairItemToEstimate(repairItemId, estimateId);
        //this method appears to work - keeping it for possible use with recall_items//
    }

//TODO NEW ENDPOINTS FOR ESTIMATES/WORKORDERS
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/workorder", method = RequestMethod.POST)
    public Estimate addWorkOrderItemsToEstimate  (@RequestBody WorkorderDTO newRepairItems) {
        return estimateDAO.addListOfRepairItemsToEstimate(newRepairItems.getSelectedItems(), newRepairItems.getEstimateId());
    }

    @RequestMapping(path = "/workorder/{estimateId}", method = RequestMethod.GET)
    public List<Repair> listOfPendingRepairs(@PathVariable int estimateId) {
        return repairDao.getListOfPendingRepairs(estimateId);
    }








    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/vehicle", method = RequestMethod.GET)
    public List<Vehicle> getUserVehicleList(Principal principal) {
        User user = userDao.getUserByUsername(principal.getName());
        return vehicleDAO.getVehicleByUserId(user.getId());
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/vehicle", method = RequestMethod.POST)
    public void createVehicle(@RequestBody Vehicle vehicle, Principal principal) {
        User user = userDao.getUserByUsername(principal.getName());
        vehicleDAO.createVehicle(vehicle, user.getId());

    }

    // TODO Add endpoint for vehicle using pathvariable
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/vehicle/{userId}", method = RequestMethod.GET)
    public List<Vehicle> getUserVehicleList(@PathVariable int userId) {
        return vehicleDAO.getVehicleByUserId(userId);
    }

    @RequestMapping(path = "/vehicle/all", method = RequestMethod.GET)
    public List<Vehicle> getAllVehicles() {
        return vehicleDAO.getEntireVehicleList();


    }

    //TODO below returns user details though Principal, not UserId
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/users", method = RequestMethod.GET)
    public UserDetail getUserInformation(Principal principal) {
        User user = userDao.getUserByUsername(principal.getName());
        return userDetailDao.getUserDetailById(user.getId());
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/users", method = RequestMethod.POST)
    public void createDetails(@RequestBody UserDetail userDetail, Principal principal) {
        User user = userDao.getUserByUsername(principal.getName());
        userDetailDao.createDetails(userDetail, user.getId());
    }

    @RequestMapping(path = "/userlist", method = RequestMethod.GET)
    public List<UserDetail> deliverUserDetailList() {
        return userDetailDao.getUserDetails();
    }

    @ResponseStatus(HttpStatus.I_AM_A_TEAPOT)
    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String getSuccessMessage() {
        return "You have reached the server";
    }


}
