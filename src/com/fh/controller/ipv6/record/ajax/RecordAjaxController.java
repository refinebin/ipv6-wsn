package com.fh.controller.ipv6.record.ajax;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fh.controller.base.BaseController;
import com.fh.service.ipv6.record.RecordManager;
import com.fh.service.ipv6.sensor.SensorManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 23:42 on 2019/3/10
 *
 * @author wenbai
 * 24099
 */
@Controller
public class RecordAjaxController extends BaseController {

    @Resource(name = "recordService")
    private RecordManager recordService;

    @Resource(name = "sensorService")
    private SensorManager sensorService;


    @RequestMapping(value = "/ajax/record/test_test", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String ajaxTestTest(@RequestParam("param1") int param) throws Exception{

        System.out.println("ajaxTestTest");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 1);
        jsonObject.put("body", "success"+param);
        return jsonObject.toJSONString();
    }


    @RequestMapping(value = "/ajax/record/selectByAreaId", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String recordInit(@RequestParam("areaId") int areaId) throws Exception{

        logger.info("recordInit");

        logger.info("areaId"+areaId);

        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("AREA_ID", areaId);

        List<PageData> seosors = sensorService.findByAreaId(pd);
        logger.info("sensors size:"+seosors.size());



        for (int i = 0; i < seosors.size(); i++) {
            logger.info(i+"sensor:"+seosors.get(i).get("SENSOR_ID"));
            pd.put("sensorId", seosors.get(i).get("SENSOR_ID"));
            List<PageData> records = recordService.findBySensorIdAndCreateTime(pd);
            logger.info("record size:"+records.size());
            if(records.size()!=0){
                logger.info("info:"+records.get(0));
                jsonArray.add(records.get(0));
            }else{
                logger.info("info:"+0);
                jsonArray.add(-1);
            }
        }


        jsonObject.put("code", 0);
        jsonObject.put("data", jsonArray);
        return jsonObject.toJSONString();
    }


    @RequestMapping(value = "/ajax/record/selectBySensorId", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectBySensorId(@RequestParam("sensorId") int sensorId) throws Exception{

        logger.info("selectBySensorId");

        logger.info("sensorId"+sensorId);

        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("SENSOR_ID", sensorId);

        List<PageData> records = recordService.findBySensorIdAndCreateTime(pd);
        logger.info("record size:"+records.size());
        if(records.size()!=0){
            jsonArray.add(records);
        }

        jsonObject.put("code", 0);
        jsonObject.put("data", jsonArray);
        return jsonObject.toJSONString();
    }


    @RequestMapping(value = "/ajax/lab/temperature", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String temperature(@RequestParam("sensorId") int sensorId) throws Exception{

        logger.info("temperature");

        logger.info("sensorId"+sensorId);

        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("SENSOR_ID", sensorId);

        List<PageData> records = recordService.findBySensorIdAndCreateTime(pd);
        logger.info("record size:"+records.size());
        if(records.size()!=0){
            jsonArray.add(records);
        }

        jsonObject.put("code", 0);
        jsonObject.put("data", jsonArray);
        return jsonObject.toJSONString();
    }

}
