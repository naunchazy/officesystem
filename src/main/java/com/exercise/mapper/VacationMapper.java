package com.exercise.mapper;

import java.util.List;

import com.exercise.pojo.po.Vacation;

public interface VacationMapper {

	List<Vacation> listVacations(Vacation vacation);

	List<Vacation> listChecks(Vacation vacation);
	
	void insertVacation(Vacation vacation);

	Vacation showCheck(Vacation vacation);

	void updateCheck(Vacation vacation);

}
