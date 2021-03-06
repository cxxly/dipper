package com.cmbc.devops.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.cmbc.devops.bean.GridBean;
import com.cmbc.devops.entity.App;
import com.cmbc.devops.entity.Tenant;

/**
 * date：2016年1月5日 下午2:20:17 project name：cmbc-devops-service
 * 
 * @author langzi
 * @version 1.0
 * @since JDK 1.7.0_21 file name：AppService.java description：
 */
public interface TenantService {

	/**
	 * @author langzi
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年1月5日 list all apps
	 */
	public List<App> listAll() throws Exception;

	/**
	 * 基于用户的租户ID查询所有应用
	 */
	public List<App> listAll_TID(int tenant_id) throws Exception;

	/**
	 * @author langzi
	 * @param pagenumber
	 * @param pagesize
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年1月5日 get one page apps
	 */
	public GridBean getOnePageApps(int pagenumber, int pagesize) throws Exception;

	/* #多租户部分，增加添加用户ID透传部分 */
	public GridBean getOnePageApps(int pagenumber, int pagesize, int user_id) throws Exception;

	/**
	 * @author langzi
	 * @param appId
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年1月5日
	 * 
	 */
	public App findAppById(int tenant_id, int appId) throws Exception;

	/**
	 * @author langzi
	 * @param app
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年4月6日
	 */
	public int addTenant(Tenant tenant) throws Exception;

	/**
	 * @author langzi
	 * @param app
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年1月5日
	 */
	public int modifyApp(App app) throws Exception;

	/**
	 * @author langzi
	 * @param app
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年1月5日
	 */
	public int removeApp(int appId) throws Exception;

	/**
	 * @author langzi
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年1月12日
	 */
	public int findLastAppId() throws Exception;

	/**
	 * @author langzi
	 * @param lbId
	 * @return
	 * @version 1.0 2016年1月18日
	 */
	public List<App> getAppByLbId(int lbId) throws Exception;

	/**
	 * @author langzi
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年1月18日
	 */
	public List<App> listAppInLb(int lbId, int tenent_id) throws Exception;

	/**
	 * @author langzi
	 * @return
	 * @throws Exception
	 * @version 1.0 2016年1月18日
	 */
	public List<App> listAppNotInLb(int tenant_id) throws Exception;

	/**
	 * @author yangqinglin
	 * @return 根据模糊名称查询应用列表
	 * @throws Exception
	 * @version 1.0 2016年3月4日
	 */
	public GridBean listSearchApps(int tenant_id, int pagenum, int pagesize, String fuzzyName) throws Exception;

	/**
	 * @author yangqinglin
	 * @return 高级查询应用列表
	 * @throws Exception
	 * @version 1.0 2016年3月4日
	 */
	public GridBean advancedSearchApp(Integer tenant_id, int pagenumber, int pagesize, JSONObject json_object)
			throws Exception;

	/** 列出租户信息 */
	public GridBean listOnePageTenants(int pagenumber, int pagesize, int tenantId) throws Exception;
}
