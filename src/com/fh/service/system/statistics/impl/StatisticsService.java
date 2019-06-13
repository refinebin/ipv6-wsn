package com.fh.service.system.statistics.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.system.statistics.StatisticsManager;

/** 
 * 说明： 访问统计
 * 创建人：FH Q313596790
 * 修改时间：2018年5月22日
 * @version
 */
@Service("statisticsService")
public class StatisticsService implements StatisticsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("StatisticsMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("StatisticsMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("StatisticsMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("StatisticsMapper.datalistPage", page);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> grlist(Page page)throws Exception{
		return (List<PageData>)dao.findForList("StatisticsMapper.grdatalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StatisticsMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StatisticsMapper.findById", pd);
	}
	
	/**pv流量
	 * @param pd
	 * @throws Exception
	 */
	public PageData pvCharts(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StatisticsMapper.pvcharts", pd);
	}
	
	/**独立IP访客
	 * @param pd
	 * @throws Exception
	 */
	public PageData ipCharts(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StatisticsMapper.ipcharts", pd);
	}
	
	/**地区统计
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> areaCharts(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StatisticsMapper.areacharts", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StatisticsMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

