package org.example.service;


import org.example.DAO.TestDAO;
import org.example.DTO.dto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ServiceImpl {
	

	@Autowired
	private TestDAO dao;

	public dto findMemberId(String name, String email) {
		return dao.findMemberId(name, email);
	}
	public dto searchEmail(String id,String email) {
		return	dao.searchEmail(id,email);
	}
	public int updatePass(dto dto,String email) {
		return dao.updatePass(dto,email);
	}
}
	
