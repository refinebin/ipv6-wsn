package com.room.receive.thread;


import com.room.receive.service.ReceiveService;
import com.room.receive.util.IpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.net.*;

/**
 * Created by 10238 on 2018/3/8.
 * @author liangjh
 */
public class ReceiveThread extends Thread{

    Logger logger = LoggerFactory.getLogger(ReceiveThread.class);

    /**
     * 服务开启/关闭
     */
    private boolean mark = true;
    /**
     * 最大接收字节长度
     */
    private final int MAX_LENGTH = 2*1024;
    /**
     * 监听端口
     */
    private final int PORT = 6666;

    /**
     * UDPServer
     */
    private DatagramSocket datagramSocket;



    private static ReceiveService receiveService;

    static{
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        receiveService = (ReceiveService) applicationContext.getBean("receiveService");
    }

    @Override
    public void run() {
        //1.启动UDPServer
        try {
            InetAddress inetAddress = Inet6Address.getByName(IpUtil.getLocalIPv6Address());

            logger.debug("ipv6:"+IpUtil.getLocalIPv6Address());
            logger.debug("ipv4:"+InetAddress.getLocalHost());
            logger.debug("...............:"+inetAddress);
//            datagramSocket = new DatagramSocket(PORT);
            datagramSocket = new DatagramSocket(PORT,inetAddress);
            logger.debug("接受服务启动中。。。");
        } catch (SocketException e) {
            logger.debug("接受服务启动失败");
            logger.debug("错误信息："+e.getMessage());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.debug("接受服务启动成功");
        while(mark){
                logger.debug("111111111111111111111111111");
            try {
                //创建接受字节流
                byte[] receiveMessages = new byte[MAX_LENGTH];
                //创建数据包
                DatagramPacket datagramPacket = new DatagramPacket(receiveMessages,receiveMessages.length);
                logger.debug("22222222222222222222222222222");
                datagramSocket.receive(datagramPacket);
                logger.debug("33333333333333333333333333333333");
                String receiveString = new String(datagramPacket.getData(), 0 , datagramPacket.getLength());
                logger.debug("4444444444444444444444444");
                //解析字符串
                if(receiveString != null && !"".equals(receiveString)){
                    logger.debug("接收数据:"+receiveString);
                    String[] dataArray = receiveString.split(";");
                    logger.debug("length:"+dataArray.length);
                    for(int index=0;index<dataArray.length-1;index++){
                        String[] sensorDataArray = dataArray[index].split(":");
                        if(sensorDataArray.length>1){
                            String sensorNumber = sensorDataArray[0];
                            String sensorValue = sensorDataArray[1];
                            receiveService.receiveSensorData(sensorNumber,sensorValue);
                        }

                    }
                }
            } catch (SocketException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {

            }
        }

//        try {
//            serverSocket = new ServerSocket(PORT);
//            logger.debug("接受服务启动中。。。");
//        } catch (IOException e) {
//            logger.debug("接受服务启动失败");
//            logger.debug("错误信息："+e.getMessage());
//        }
//        Socket socket = null;
//        while(mark){
//            logger.debug("接受服务启动成功");
//            try {
//                socket = serverSocket.accept();
//                logger.debug("连接成功，连接socket为:"+socket.getInetAddress());
//                InputStream inputStream = socket.getInputStream();
//                InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
//                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
//                String receiveString = bufferedReader.readLine();
//                //解析字符串
//                if(receiveString != null){
//                    logger.debug("接收数据:"+receiveString);
//                    String[] dataArray = receiveString.split(";");
//                    for(int index=0;index>dataArray.length;index++){
//                        String[] sensorDataArray = dataArray[index].split(":");
//                        String sensorNumber = sensorDataArray[0];
//                        String sensorValue = sensorDataArray[1];
//                        receiveService.receiveSensorData(sensorNumber,sensorValue);
//                    }
//                }
//            } catch (SocketException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            } finally {
//
//            }
//        }
//
//
//        //2.接受数据
//
//
    }

    public void close(){
        mark = false;
    }

}
