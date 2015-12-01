package com.compass.myapp.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compass.myapp.model.Employee;
import com.compass.myapp.model.Status;
import com.compass.myapp.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	static final Logger logger = Logger.getLogger(EmployeeController.class);
	
	@RequestMapping(value = "/create", method = RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	Status addEmployee(@RequestBody Employee employee) {
		try {
			System.out.println("=====================>>>>>>>>>>>>>>>>>>>>> addEmployee Called ");
			
			employeeService.addEntity(employee);
			return new Status(1, "Employee added Successfully !");
		} catch (Exception e) {
			// e.printStackTrace();
			return new Status(0, e.toString());
		}
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public @ResponseBody
	Employee getEmployee(@PathVariable("id") long id) {
		Employee employee = null;
		try {
			employee = employeeService.getEntityById(id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return employee;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody
	List<Employee> getEmployee() {

		List<Employee> employeeList = null;
		try {
			employeeList = employeeService.getEntityList();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return employeeList;
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public @ResponseBody
	Status deleteEmployee(@PathVariable("id") long id) {

		try {
			employeeService.deleteEntity(id);
			return new Status(1, "Employee deleted Successfully !");
		} catch (Exception e) {
			return new Status(0, e.toString());
		}
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody
	Status updateEmployee(@PathVariable("id") long id,@RequestBody Employee emp){
		System.out.println("=====================>>>>>>>>>>>>>>>>>>>>>  "+emp.getFirstName());
		try{
			employeeService.updateEmployee(id,emp);
			return new Status(1, "Employee Updated Successfully !");
		}
		catch(Exception e){
			return new Status(0, e.toString());
		}
		
	}
	
//	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
//	public @ResponseBody
//	Employee getEmployee(@PathVariable("id") long id) {
//		Employee employee = null;
//		try {
//			employee = employeeService.getEntityById(id);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return employee;
//	}

}
