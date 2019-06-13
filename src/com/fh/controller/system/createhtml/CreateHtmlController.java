package com.fh.controller.system.createhtml;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.service.web.aboutus.AboutusManager;
import com.fh.service.web.contactus.ContactusManager;
import com.fh.service.web.cooperation.CooperationManager;
import com.fh.service.web.corporatephilosophy.CorporatephilosophyManager;
import com.fh.service.web.image.ImageManager;
import com.fh.service.web.information.InformationManager;
import com.fh.service.web.news.NewsManager;
import com.fh.service.web.ourbusiness.OurBusinessManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DelAllFile;
import com.fh.util.Freemarker;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;

/** 
 * 类名称： 页面静态化
 * 创建人：FH Q 3 13596790
 * 修改时间：2018-7-1
 * @version
 */
@Controller
@RequestMapping(value="/createHtml")
public class CreateHtmlController extends BaseController {
	
	@Resource(name="informationService")
	private InformationManager informationService;
	@Resource(name="imageService")
	private ImageManager imageService;
	@Resource(name="ourbusinessService")
	private OurBusinessManager ourbusinessService;
	@Resource(name="corporatephilosophyService")
	private CorporatephilosophyManager corporatephilosophyService;
	@Resource(name="contactusService")
	private ContactusManager contactusService;
	@Resource(name="aboutusService")
	private AboutusManager aboutusService;
	@Resource(name="cooperationService")
	private CooperationManager cooperationService;
	@Resource(name="newsService")
	private NewsManager newsService;
	
	/**选择模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/setMoban")
	@ResponseBody
	public Object setMoban() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"选择模版");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		Tools.writeFile(Const.FTLPATH,pd.getString("moban"));	//模版配置
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成首页html
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proHome")
	@ResponseBody
	public Object proCode(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getCp(root);				//公司理念
		this.getOurbusiness(root);		//我们的业务
		this.getImg(root,"1");			//首页轮播图
		this.getImg(root,"2");			//项目案例
		this.getImg(root,"3");			//合作伙伴
		this.getImg(root,"4");			//技术团队
		DelAllFile.delFolder(PathUtil.getClasspath()+"index.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("indexTemplate.ftl", root, "index.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成关于我们页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proAboutus")
	@ResponseBody
	public Object proAboutus(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		PageData pdC = new PageData();
		pdC.put("ABOUTUS_ID", "1");
		pdC = aboutusService.findById(pdC);
		root.put("ABOUTUS", pdC.getString("CONTENT")); //联系我们
		DelAllFile.delFolder(PathUtil.getClasspath()+"webaboutus.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("aboutusTemplate.ftl", root, "webaboutus.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成产品案例页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proProduct")
	@ResponseBody
	public Object proProduct(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		this.getImg(root,"5");			//产品案例
		DelAllFile.delFolder(PathUtil.getClasspath()+"webproduct.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("productTemplate.ftl", root, "webproduct.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成合作共赢页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proCooperation")
	@ResponseBody
	public Object proCooperation(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		PageData pdC = new PageData();
		pdC.put("COOPERATION_ID", "1");
		pdC = cooperationService.findById(pdC);
		root.put("cooperation", pdC.getString("CONTENT")); //联系我们
		DelAllFile.delFolder(PathUtil.getClasspath()+"webcooperation.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("cooperationTemplate.ftl", root, "webcooperation.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成新闻动态页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proNews")
	@ResponseBody
	public Object proNews(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		this.getNews(root);				//新闻列表
		DelAllFile.delFolder(PathUtil.getClasspath()+"webnews.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("newsTemplate.ftl", root, "webnews.html", "", getFtlPath());
		this.proNewsdetail();			//生成新闻明细页
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**生成新闻动态详细页面
	 * @param response
	 * @throws Exception
	 */
	public void proNewsdetail() throws Exception{
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		DelAllFile.delFolder(PathUtil.getClasspath()+"webnewsdetail.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("newsdetailTemplate.ftl", root, "webnewsdetail.html", "", getFtlPath());
	}
	
	/**生成联系我们页面
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/proContactus")
	@ResponseBody
	public Object proContactus(HttpServletResponse response) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"执行页面静态化");
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		this.getInfo(root);				//网站基本信息
		this.getImg(root,"4");			//技术团队
		PageData pdC = new PageData();
		pdC.put("CONTACTUS_ID", "1");
		pdC = contactusService.findById(pdC);
		root.put("CONTACTUS", pdC.getString("CONTENT")); 	//联系我们
		root.put("DIMENSION", pdC.getString("DIMENSION")); 	//纬度
		root.put("LONGITUDE", pdC.getString("LONGITUDE")); 	//经度
		root.put("PZOOM", pdC.getString("PZOOM")); 			//拉伸
		DelAllFile.delFolder(PathUtil.getClasspath()+"webcontactus.html"); //生成代码前,先清空之前生成的文件
		Freemarker.printFile("contactusTemplate.ftl", root, "webcontactus.html", "", getFtlPath());
		map.put("result", "success");
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/** 获取新闻列表
	 * @param root
	 * @throws Exception
	 */
	public void getNews(Map<String,Object> root) throws Exception{
		PageData pdNews = new PageData();
		pdNews.put("start", 0);
		pdNews.put("newsnumber", 3);
		List<PageData> listNews = newsService.listAll(pdNews);
		List<String[]> fieldList = new ArrayList<String[]>(); 
		for(int i=0;i<listNews.size();i++){
			String[] array = new String[6]; 
			array[0] = listNews.get(i).getString("NEWS_ID");		//ID
			array[1] = listNews.get(i).getString("TITLE");			//标题
			array[2] = listNews.get(i).getString("CTIME");			//发表时间
			array[3] = listNews.get(i).getString("STEMFROM");		//来源
			array[4] = listNews.get(i).getString("IMAGE");			//图片
			array[5] = listNews.get(i).getString("SHORTCONTENT");	//简述
			fieldList.add(array);
		}
		root.put("listNews", fieldList);	
	}
	
	/** 图片
	 * @param root
	 * @throws Exception
	 */
	public void getImg(Map<String,Object> root, String TYPE) throws Exception{
		PageData pdImg = new PageData();
		pdImg.put("TYPE", TYPE);
		List<PageData> listImg1 = imageService.listAll(pdImg);
		List<String[]> fieldList = new ArrayList<String[]>(); 
		for(int i=0;i<listImg1.size();i++){
			String[] array = new String[4]; 
			array[0] = listImg1.get(i).getString("TITLE");	//图片标题
			array[1] = listImg1.get(i).getString("IMGURL");	//图片地址
			array[2] = listImg1.get(i).getString("TOURL");	//图片链接
			array[3] = listImg1.get(i).getString("BZ");		//图片备注
			fieldList.add(array);
		}
		root.put("fieldList"+TYPE, fieldList);	
	}
	
	/** 网站基本信息
	 * @param root
	 * @throws Exception
	 */
	public void getInfo(Map<String,Object> root) throws Exception{
		PageData pdInfo = new PageData();
		pdInfo.put("INFORMATION_ID", "1");
		pdInfo = informationService.findById(pdInfo);
		root.put("NAME", pdInfo.getString("NAME"));					//网站名称
		root.put("TITLE", pdInfo.getString("TITLE"));				//网站标题
		root.put("KEYWORDS", pdInfo.getString("KEYWORDS"));			//网站关键词
		root.put("DESCRIPTION", pdInfo.getString("DESCRIPTION"));	//网站描述
		root.put("LOGO", pdInfo.getString("LOGO"));					//LOGO
		root.put("TEL", pdInfo.getString("TEL"));					//电话
		root.put("EMAIL", pdInfo.getString("EMAIL"));				//邮箱
		root.put("QQ", pdInfo.getString("QQ"));						//QQ
		root.put("FAX", pdInfo.getString("FAX"));					//传真
		root.put("WEBURL", pdInfo.getString("WEBURL"));				//官网
		root.put("ADDRESS", pdInfo.getString("ADDRESS"));			//地址
		root.put("COPYRIGHT", pdInfo.getString("COPYRIGHT"));		//版权
		root.put("TECHNOLOGY", pdInfo.getString("TECHNOLOGY"));		//技术支持
		root.put("BEIAN", pdInfo.getString("BEIAN"));				//备案
		root.put("ABOUTUS1", pdInfo.getString("ABOUTUS1"));			//关于我们上
		root.put("ABOUTUS2", pdInfo.getString("ABOUTUS2"));			//关于我们下
		root.put("NEW1", pdInfo.getString("NEW1"));					//最新消息1
		root.put("NEW2", pdInfo.getString("NEW2"));					//最新消息2
	}
	
	/** 网站首页我们的业务
	 * @param root
	 * @throws Exception
	 */
	public void getOurbusiness(Map<String,Object> root) throws Exception{
		PageData pdOb = new PageData();
		pdOb.put("OURBUSINESS_ID", "1");
		pdOb = ourbusinessService.findById(pdOb);
		root.put("TITLE1", pdOb.getString("TITLE1"));				//介绍上
		root.put("TITLE2", pdOb.getString("TITLE2"));				//介绍下
		root.put("CONTENT1", pdOb.getString("CONTENT1"));			//内容上
		root.put("CONTENT2", pdOb.getString("CONTENT2"));			//内容上
		root.put("TOURL", pdOb.getString("TOURL"));					//内容链接
		root.put("OTHER1", pdOb.getString("OTHER1"));				//其他1
		root.put("OTHER2", pdOb.getString("OTHER2"));				//其他2
		root.put("IMG1", pdOb.getString("IMG1"));					//图1
		root.put("IMG2", pdOb.getString("IMG2"));					//图2
		root.put("IMG3", pdOb.getString("IMG3"));					//图1
		root.put("IMG4", pdOb.getString("IMG4"));					//图2
		root.put("M3_TITLE", pdOb.getString("M3_TITLE"));			//标题
		root.put("M3_CONTENT1", pdOb.getString("M3_CONTENT1"));		//内容1
		root.put("M3_CONTENT2", pdOb.getString("M3_CONTENT2"));		//内容2
		root.put("M3_CONTENT3", pdOb.getString("M3_CONTENT3"));		//内容3
	}
	
	/** 公司理念
	 * @param root
	 * @throws Exception
	 */
	public void getCp(Map<String,Object> root) throws Exception{
		for(int i=1;i<5;i++){
			PageData pdCp = new PageData();
			pdCp.put("CORPORATEPHILOSOPHY_ID", i);
			pdCp = corporatephilosophyService.findById(pdCp);
			root.put("CPTITLE"+i, pdCp.getString("TITLE"));		//标题
			root.put("CPCONTENT"+i, pdCp.getString("CONTENT"));	//内容
			root.put("CPTOURL"+i, pdCp.getString("TOURL"));		//链接
		}
	}
	
	/**
	 * 获取路径
	 */
	public String getFtlPath(){
		return Tools.readTxtFile(Const.FTLPATH);
	}
	
}
//FHQ 3 1 3 5 9 6 7 9 0