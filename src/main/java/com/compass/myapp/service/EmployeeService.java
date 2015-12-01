package com.compass.myapp.service;

import java.util.List;

import com.compass.myapp.model.Employee;

public interface EmployeeService {
	public boolean addEntity(Employee employee) throws Exception;
	public Employee getEntityById(long id) throws Exception;
	public List<Employee> getEntityList() throws Exception;
	public boolean deleteEntity(long id) throws Exception;
	public boolean updateEmployee(long id,Employee emp) throws Exception;
}
