package com.fh.controller.web;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.system.blacklist.BlacklistManager;
import com.fh.service.system.statistics.StatisticsManager;
import com.fh.service.web.leavemsg.LeavemsgManager;
import com.fh.service.web.news.NewsManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;

/** 
 * 说明：访问首页)
 * 创建人：FH Q313596790
 * 修改时间：2018-06-30
 */
@Controller
@RequestMapping(value="/web")
public class WebController extends BaseController {

	@Resource(name="leavemsgService")
	private LeavemsgManager leavemsgService;
	@Resource(name="newsService")
	private NewsManager newsService;
	@Resource(name="statisticsService")
	private StatisticsManager statisticsService;
	@Resource(name="blacklistService")
	private BlacklistManager blacklistService;
	
	/**访问首页(废弃,默认访问的首页是根目录index.html)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public ModelAndView toindex()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("web/index");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**保存访客留言
	 * @return
	 */
	@RequestMapping(value="/saveLeavemsg")
	@ResponseBody
	public Object saveLeavemsg(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			pd.put("LEAVEMSG_ID", this.get32UUID());		//主键
			pd.put("CTIME", Tools.date2Str(new Date()));	//提交时间
			leavemsgService.save(pd);
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**获取新闻瀑布流
	 * @return
	 */
	@RequestMapping(value="/getNewTitle")
	@ResponseBody
	public Object getNewTitle(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			pd.put("start", Integer.parseInt(pd.getString("start")));
			pd.put("newsnumber", 1);
			List<PageData> listNews = newsService.listAll(pd);
			if(listNews.size() > 0){
				pd = listNews.get(0);
				pd.put("hasNext", "yes");
			}else{
				pd.put("hasNext", "no");
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		map.put("new", pd);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**获取新闻详情
	 * @return
	 */
	@RequestMapping(value="/getNew")
	@ResponseBody
	public Object getNew(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			pd.put("NEWS_ID", pd.getString("NEWID"));
			pd = newsService.findById(pd);	//根据ID读取
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		map.put("new", pd);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**访问记录
	 * @return
	 */
	@RequestMapping(value="/addStatistics")
	public void addStatistics(){
		PageData pd = new PageData();
		pd = this.getPageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		String path="http://ip.taobao.com/service/getIpInfo.php?ip="+ip;
		try {
			URL url=new URL(path);
			HttpURLConnection http = (HttpURLConnection)url.openConnection();
			http.setDoOutput(true);
			http.setDoInput(true);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			http.connect();
			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] bt = new byte[size];
			is.read(bt);
			String message=new String(bt,"UTF-8");
			JSONObject jsonMsg = JSONObject.fromObject(message);
			JSONObject jsonMsg2 = JSONObject.fromObject(jsonMsg.getString("data"));
			String country = jsonMsg2.getString("country");
			String area = jsonMsg2.getString("area");
			String region = jsonMsg2.getString("region");
			String city = jsonMsg2.getString("city");
			String isp = jsonMsg2.getString("isp");
			String AREA = country+" "+area+" "+region+" "+city;
			pd.put("STATISTICS_ID", this.get32UUID());		//主键
			pd.put("IP", ip);			//IP
			pd.put("AREA", AREA);		//地区
			pd.put("REGION", "内网IP".equals(AREA.trim())?"局域网":region);	//省/直辖市
			pd.put("OPERATOR", isp);	//运营商
			pd.put("CDATE", DateUtil.getDay());				//日期
			pd.put("CTIME", Tools.date2Str(new Date()));	//时间
			try {
				statisticsService.save(pd);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**判断访客IP是否在黑名单
	 * @return
	 */
	@RequestMapping(value="/isBlack")
	@ResponseBody
	public Object isBlack(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		HttpServletRequest request = this.getRequest();
		String IP = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			IP = request.getRemoteAddr();  
	    }else{
	    	IP = request.getHeader("x-forwarded-for");  
	    }
		String result = "OK";
		try{
			pd.put("IP", IP);
			List<PageData>	varList = blacklistService.listAll(pd);
			if(varList.size() > 0){
				result = "NO";
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
}
