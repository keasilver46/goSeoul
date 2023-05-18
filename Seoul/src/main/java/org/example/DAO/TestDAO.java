package org.example.DAO;

import org.example.DTO.dto;


public interface TestDAO {


	public dto findMemberId(String name, String email);
	
	public int updatePass(dto dto,String email);

	public dto searchId(String id);
	
	public dto searchEmail (String email);
	
	public dto searchDomain(String domain);
	
	public String concat(String id);

	
	}

