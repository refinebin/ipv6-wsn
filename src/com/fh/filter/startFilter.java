package com.fh.filter;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


import com.fh.util.DbFH;
import com.fh.controller.base.BaseController;

/**
 * 启动tomcat时运行此类
 * 创建人：FH FH QQ 313596790[青苔]
 * 创建时间：2018年6月17日
 * @version
 */
public class startFilter extends BaseController implements Filter{
	
	/**
	 * 初始化
	 */
	public void init(FilterConfig fc) throws ServletException {
		this.reductionDbBackupQuartzState();
	}
	
	
	/**
	 * web容器重启时，所有定时备份状态关闭
	 */
	public void reductionDbBackupQuartzState(){
		try {
			DbFH.executeUpdateFH("update DB_TIMINGBACKUP set STATUS = '2'");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 计时器(废弃)用quartz代替
	 */
	public void timer() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 9); // 控制时
		calendar.set(Calendar.MINUTE, 0); 		// 控制分
		calendar.set(Calendar.SECOND, 0); 		// 控制秒
		Date time = calendar.getTime(); 		// 得出执行任务的时间
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new TimerTask() {
			public void run() {
				//PersonService personService = (PersonService)ApplicationContext.getBean("personService");
				//System.out.println("-------设定要指定任务--------");
			}
		}, time, 1000*60*60*24);// 这里设定将延时每天固定执行
	}
	
	public void destroy() {
		// TODO Auto-generated method stub
	}
	
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
	}
	
}
