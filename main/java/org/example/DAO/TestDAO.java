package org.example.DAO;

import org.example.DTO.dto;
import org.springframework.stereotype.Repository;


@Repository
public interface TestDAO {

	public dto searchEmail (String id,String email);

	public dto findMemberId(String name, String email);
	
	public int updatePass(dto dto,String email);
	
	}

