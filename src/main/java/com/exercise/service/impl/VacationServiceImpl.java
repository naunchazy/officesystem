package com.exercise.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exercise.mapper.VacationMapper;
import com.exercise.pojo.po.Vacation;
import com.exercise.service.IVacationService;
@Service
@Transactional(readOnly=true)
public class VacationServiceImpl implements IVacationService {

	@Autowired
	VacationMapper vMapper;

	@Override
	public List<Vacation> listVacations(Vacation vacation) {
		List<Vacation> myVacations = null;
		try {
			myVacations = vMapper.listVacations(vacation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return myVacations;
	}

	@Override
	public List<Vacation> listChecks(Vacation vacation) {
		List<Vacation> listChecks = null;
		try {
			listChecks = vMapper.listChecks(vacation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listChecks;
	}
	
	@Override
	@Transactional(readOnly=false)
	public void insertVacation(Vacation vacation) {
		try {
			vMapper.insertVacation(vacation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Vacation showCheck(Vacation vacation) {
		Vacation showCheck = null;
		try {
			showCheck = vMapper.showCheck(vacation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return showCheck;
	}

	@Override
	public void updateCheck(Vacation vacation) {
		try {
			vMapper.updateCheck(vacation);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
