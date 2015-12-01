package com.compass.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.compass.myapp.dao.EmployeeDAO;
import com.compass.myapp.model.Employee;

public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	EmployeeDAO employeeDao;
	@Override
	public boolean addEntity(Employee employee) throws Exception {
		return employeeDao.addEntity(employee);
	}

	@Override
	public Employee getEntityById(long id) throws Exception {
		return employeeDao.getEntityById(id);
	}

	@Override
	public List<Employee> getEntityList() throws Exception {
		return employeeDao.getEntityList();
	}

	@Override
	public boolean deleteEntity(long id) throws Exception {
			return employeeDao.deleteEntity(id);
	}


	@Override
	public boolean updateEmployee(long id, Employee emp) throws Exception {
		//checking the parameter emp on console
		System.out.println(this.getClass().getName()+"   id is "+id+" EMPLOYEE is "+emp.getFirstName() );
		//getting existing employee data from database
		Employee oldData = employeeDao.getEntityById(id);
		System.out.println(this.getClass().getName()+"   id is "+id+" oldData EMPLOYEE is "+oldData.getFirstName() );
		//setting the object properties to the one from the parameter  
		oldData.setFirstName(emp.getFirstName());
		oldData.setLastName(emp.getLastName());
		oldData.setEmail(emp.getEmail());
		oldData.setPhone(emp.getPhone());
		
		return employeeDao.updateEntity(oldData);
	}

}
