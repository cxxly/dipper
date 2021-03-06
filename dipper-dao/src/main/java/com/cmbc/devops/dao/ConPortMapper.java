package com.cmbc.devops.dao;

import java.util.List;

import com.cmbc.devops.entity.ConPort;
import com.cmbc.devops.exception.SqlException;

public interface ConPortMapper {

	/**
	 * @author langzi
	 * @param record
	 * @return
	 * @throws SqlException
	 * @version 1.0
	 * 2015年8月31日
	 * insert conport entity to DB
	 */
	public int insertConport(ConPort record) throws SqlException;
    
	/**
	 * @author langzi
	 * @param id
	 * @return
	 * @throws SqlException
	 * @version 1.0
	 * 2015年8月31日
	 * delete conport entity from DB by containerIds
	 */
	public int deleteConport(String[] containerIds) throws SqlException;
    
	/**
	 * @author langzi
	 * @param record
	 * @return
	 * @throws SqlException
	 * @version 1.0
	 * 2015年8月31日
	 * update conport entity to DB
	 */
	public int updateConport(ConPort record) throws SqlException;
	
	/**
	 * @author langzi
	 * @param conPort
	 * @return
	 * @throws SqlException
	 * @version 1.0
	 * 2015年8月31日
	 * select conport entities from DB by container Id
	 */
	public List<ConPort> selectConport(Integer containerId) throws SqlException;
	
	/**
	 * @author langzi
	 * @param appId
	 * @return
	 * @throws SqlException
	 * @version 1.0
	 * 2015年9月15日
	 * select conport entiteis from DB by application Id
	 */
	public List<ConPort> selectConportByAppId(Integer appId) throws SqlException;

}