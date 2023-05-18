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
	public int updatePass(dto dto,String email) {
		return dao.updatePass(dto,email);
	}
	public dto searchEmail(String email) {
		return	dao.searchEmail(email);
	}
	public dto searchId(String id) {
		return	dao.searchId(id);
	}
	public dto searchDomain(String domain) {
		return	dao.searchDomain(domain);
	}
	public String concat(String id) {
		return	dao.concat(id);
	}
}
	
