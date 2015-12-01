package com.compass.myapp.dao;

import java.util.List;

import com.compass.myapp.model.Employee;


public interface EmployeeDAO {
	public boolean addEntity(Employee employee) throws Exception;
	public Employee getEntityById(long id) throws Exception;
	public List<Employee> getEntityList() throws Exception;
	public boolean deleteEntity(long id) throws Exception;
	boolean updateEntity(Employee emp) throws Exception;
}
