package com.fh.controller.system.statistics;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.service.system.statistics.StatisticsManager;

/** 
 * 说明：流量图表统计
 * 创建人：FH Q313596790
 * 修改时间：2018-7-1
 */
@Controller
@RequestMapping(value="/chartsstatistics")
public class ChartsStatisticsController extends BaseController {
	
	String menuUrl = "chartsstatistics/list.do"; //菜单地址(权限用)
	@Resource(name="statisticsService")
	private StatisticsManager statisticsService;
	
	/**去图表展示页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/pvcharts")
	public ModelAndView pvCharts()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String CDATE = pd.getString("CDATE");				//前台检索提交的参数
		if(Tools.isEmpty(CDATE)){
			CDATE = DateUtil.getDay();						//日期检索条件, 默认是当天
		}
		
		/*图表*/
		String str1 = "";
		String str2 = "";
		String str3 = "";
		String str4 = "";
		String str5 = "";
		String pstr1 = "";
		String pstr2 = "";
		String pstr3 = "";
		int ZPVCOUNT = 0;									//一天的总流量
		int ZIPCOUNT = 0;									//一天的总访客
		
		str1 += "<graph decimals='2' caption='"+CDATE+"  PV(点击)流量折线图' xAxisName='小时' yAxisName='浏览次数' decimalPrecision='0' formatNumberScale='0' baseFontSize='11'>";
		str2 += "<graph decimals='2' caption='"+CDATE+"  PV(点击)流量柱状图' xAxisName='小时' yAxisName='浏览次数' decimalPrecision='0' formatNumberScale='0' baseFontSize='11'>";
		str3 += "<graph decimals='2' caption='"+CDATE+"  独立IP访客(每时)折线图' xAxisName='小时' yAxisName='人数' decimalPrecision='0' formatNumberScale='0' baseFontSize='11'>";
		str4 += "<graph decimals='2' caption='"+CDATE+"  独立IP访客(每时)柱状图' xAxisName='小时' yAxisName='人数' decimalPrecision='0' formatNumberScale='0' baseFontSize='11'>";
		str5 += "<graph decimals='2' caption='"+CDATE+"  省份/直辖市饼状图' xAxisName='省份/直辖市' yAxisName='人数' decimalPrecision='0' formatNumberScale='0' baseFontSize='11'>";
		
		String[] color = {"AFD8F8","F6BD0F","8BBA00","FF8E46","008E8E","D64646","8E468E","588526","B3AA00","008ED6","9D080D","A186BE","AFD8F8","F6BD0F","8BBA00","FF8E46","008E8E","D64646","8E468E","588526","B3AA00","008ED6","9D080D","A186BE"};
		
		PageData zpd = new PageData();
		zpd.put("CDATE", CDATE);							//日期参数
		for(int i=0; i<24; i++){							//统计一天24小时
			zpd.put("HOUR", i<10?"0"+i:String.valueOf(i));	//小时参数, 当i<10的时候 拼接 01 02 03 ……
			
			/** pv */
			PageData pvpd = new PageData();
			pvpd = statisticsService.pvCharts(zpd);
			int PVCOUNT = 0;
			if(null != pvpd){
				PVCOUNT = Integer.parseInt(pvpd.get("PVCOUNT").toString());
				ZPVCOUNT = ZPVCOUNT + PVCOUNT;
			}
			pstr1 =  pstr1 + "<set name='" + i + "' value='"+PVCOUNT+"' color='"+color[i]+"'/>";
			
			/** ip */
			PageData ippd = new PageData();
			ippd = statisticsService.ipCharts(zpd);
			int IPCOUNT = 0;
			if(null != ippd){
				IPCOUNT = Integer.parseInt(ippd.get("IPCOUNT").toString());
			}
			pstr2 =  pstr2 + "<set name='" + i + "' value='"+IPCOUNT+"' color='"+color[i]+"'/>";
		}
		
		str1 = str1 + pstr1;
		str1 += "</graph>";
		str2 = str2 + pstr1;
		str2 += "</graph>";
		
		str3 = str3 + pstr2;
		str3 += "</graph>";
		str4 = str4 + pstr2;
		str4 += "</graph>";
		
		/** 省份/直辖市 */
		List<PageData> arealist = new ArrayList<PageData>();
		arealist  = statisticsService.areaCharts(zpd);
		for(int i=0; i<arealist.size(); i++){
			int ZIP = Integer.parseInt(arealist.get(i).get("ZCOUNT").toString());
			pstr3 =  pstr3 + "<set name='" + arealist.get(i).getString("REGION") + "' value='"+ZIP+"' color='"+color[i]+"'/>";
			ZIPCOUNT = ZIPCOUNT + ZIP;
		}
		str5 = str5 + pstr3;
		str5 += "</graph>";
		
		mv.setViewName("system/statistics/statistics_chars");
		mv.addObject("str1",str1);
		mv.addObject("str2",str2);
		mv.addObject("str3",str3);
		mv.addObject("str4",str4);
		mv.addObject("str5",str5);
		mv.addObject("ZPVCOUNT",ZPVCOUNT);
		mv.addObject("ZIPCOUNT",ZIPCOUNT);
		mv.addObject("CDATE",CDATE);
		return mv;
	}	
	
}
