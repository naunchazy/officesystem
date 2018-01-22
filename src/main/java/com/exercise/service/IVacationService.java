package com.exercise.service;

import java.util.List;

import com.exercise.pojo.po.Vacation;

public interface IVacationService {

	List<Vacation> listVacations(Vacation vacation);

	void insertVacation(Vacation vacation);

	List<Vacation> listChecks(Vacation vacation);

	Vacation showCheck(Vacation vacation);

	void updateCheck(Vacation vacation);

}
