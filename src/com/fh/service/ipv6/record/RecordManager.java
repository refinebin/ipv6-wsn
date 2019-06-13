package com.fh.service.ipv6.record;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/** 
 * 说明： 传感器数据记录模块接口
 * 创建人：FH Q313596790
 * 创建时间：2018-11-29
 * @version
 */
public interface RecordManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	/**通过传感器id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findBySensorId(PageData pd)throws Exception;


	/**
	 * 实时监控
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findBySensorIdAndCreateTime(PageData pd)throws Exception;

	/**通过传感器id和时间获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findBySensorIdAndDate(PageData pd)throws Exception;

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

