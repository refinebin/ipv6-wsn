package com.fh.service.ipv6.record.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.ipv6.record.RecordManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 传感器数据记录模块
 * 创建人：FH Q313596790
 * 创建时间：2018-11-29
 * @version
 */
@Service("recordService")
public class RecordService implements RecordManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("RecordMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("RecordMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("RecordMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("RecordMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("RecordMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("RecordMapper.findById", pd);
	}

	@Override
	/**通过传感器id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findBySensorId(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("RecordMapper.findBySensorId", pd);
	}

	@Override
	public List<PageData> findBySensorIdAndCreateTime(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("RecordMapper.findBySensorIdAndCreateTime", pd);
	}

	@Override
	/**通过传感器id和时间获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findBySensorIdAndDate(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("RecordMapper.findBySensorIdAndDate", pd);
	}

	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("RecordMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

