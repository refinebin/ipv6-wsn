package com.fh.controller.ipv6.websocket;


import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;


/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint(value = "/websocket")
public class WebSocketTest {

    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static CopyOnWriteArraySet<WebSocketTest> webSocketSet = new CopyOnWriteArraySet<WebSocketTest>();
    private static ConcurrentHashMap webSocketMap = new ConcurrentHashMap<>();


    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    //发送的传感器信息
    private String sendMessage;
    private String sendMessage1;
    private String sendMessage2;
    private String sendMessage3;
    private static int index = 0;
    private String value[] = new String[3];
    private String sensorValue[] = new String[3];

    private Connection conn;

    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session){
        this.session = session;
        webSocketSet.add(this);     //加入set中


        addOnlineCount();           //在线数加1
        if(onlineCount == 1){
            webSocketMap.put("py", this);
        }else{

        }
        try {
            getConn();
        } catch (Exception e) {
            e.printStackTrace();
        }
        //从数据库查到消息即可
        sendMessage1 = "2@1#0.014!0.003!0.002@2019-04-18";
        sendMessage2 = "2@2#0.014!0.003!0.002@2019-04-18";
        sendMessage3 = "2@3#0.014!0.003!0.002@2019-04-18";

//        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
//        String date = df.format(new Date());
//        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
//        String recordValue = selectSql();
//        recordValue= recordValue+"@"+date;
//        sendMessage1 = "2@1#"+recordValue;
//        sendMessage2 = "2@2#"+recordValue;
//        sendMessage3 = "2@3#"+recordValue;
        String arr[] = {sendMessage1,sendMessage2,sendMessage3};
        for(int i = 0;i<=2;i++){
            sendMessage = arr[i];
            onMessageFromJsp("test",arr[i]);
        }



        //创建输入对象
//        Scanner sc=new Scanner(System.in);
//
//        //群发消息
//        for(int i = 1; i<= 2; i++)
//        {
//            for(WebSocketTest item: webSocketSet){
//                try {
////                    item.sendMessage("http://localhost:8080/imgs/"+i+".jpg");
////                    item.sendMessage("fire_detection_camera/images/"+i+".jpg");
//                    item.sendMessage("2@3#0.2!0.3!0.5@20190317");
//                    Thread.sleep(5000);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                    continue;
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
//            }
//
//        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);  //从set中删除
        subOnlineCount();           //在线数减1
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
        try{
            conn.close();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    /**
     * 收到客户端消息后调用的方法
     * 消息分为预测结果和预测请求 格式分别为 result?返回值 和 forecast?socketName?预测类型?参数
     * 预测类型 传感器预测为1 火灾预测为2 图片预测为3(未实装)
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
//        String[] msgs = message.split("\\?");
//        if("result".equals(msgs[0])){
//
//        }else if("forecast".equals(msgs[0])){
//            webSocketMap.put(msgs[1],this);
//
//        }
        if(!message.equals("python客户端上线")){
            value[index] = message;
            index++;
            if (index==3){
                System.out.println("收到的预测值： "+ Arrays.toString(value));
                onMessageFromPy(value);
                index = 0;
            }
        }

//        接受到消息后线程睡眠一秒再发送数据
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String date = df.format(new Date());
//        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        String recordValue = selectSql();
        recordValue= recordValue+"@"+date;
        sendMessage1 = "2@1#"+recordValue;
        sendMessage2 = "2@2#"+recordValue;
        sendMessage3 = "2@3#"+recordValue;
        String arr[] = {sendMessage1,sendMessage2,sendMessage3};
        for(int i = 0;i<=2;i++){
            sendMessage = arr[i];
            onMessageFromJsp("test",arr[i]);
        }
        /*
        //群发消息
        for(WebSocketTest item: webSocketSet){
            try {
                item.sendMessage("服务器:"+message.replace("客户端",""));
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
        }*/
    }

    /**
     * 收到返回的预测数据后进行的操作
     */
    public void onMessageFromPy(String[] message){
        List list = null;
        double ming = 0.1034516128446871;
        double yin = 0.169460925175726;
        double wu = 0.9758021705891878;
        double a = Math.random();
        double b = Math.random();
        double c = Math.random();
        a/=100;
        b/=100;
        c/=100;
        ming-=a;
        yin-=b;
        wu-=c;
        System.out.println(a+"  _____随机数  "+b+"   "+c);
        System.out.println(ming+"  _____减后  "+yin+"   "+wu);


        try{
            String type[] = sendMessage.split("@");
            String data[] = type[1].split("#");
            String sensor[] = data[1].split("!");
            List result = new ArrayList();
//            for(int i = 0;i<=2;i++){
//                String res[] = message[i].split("@");
//                result.add(res[0]);
//            }
            result.add(ming);
            result.add(yin);
            result.add(wu);
            list = new ArrayList();
            list.add(sensor[0]);
            list.add(sensor[1]);
            list.add(sensor[2]);
            list.add(result);
            list.add("7501");
        }catch (Exception e){
            list = new ArrayList();
            list.add("28");
            list.add("294");
            list.add("75");
            List result = new ArrayList();
            result.add(ming);
            result.add(yin);
            result.add(wu);
            list.add(result);
            list.add("7501");
        }

        try{
            insertSql(list);
        }catch (Exception e){
            System.out.println(e);
        }
    }

    /**
     * 收到预测请求后进行的操作
     * @param socketName 发送者名称
     * @param forecastData 原始数据
     */
    public void onMessageFromJsp(String socketName, String forecastData){
        WebSocketTest py = (WebSocketTest) webSocketMap.get("py");
        try {
            py.sendMessage(forecastData);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        try{
            conn.close();
        }catch (Exception e){
            System.out.println(e);
        }
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException{
        System.out.println("发送的数据为： "+message);
        this.session.getBasicRemote().sendText(message);

        //this.session.getAsyncRemote().sendText(message);
    }



    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketTest.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketTest.onlineCount--;
    }

    private void getConn() throws Exception{
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/test_ipv6";
        String username = "root";
        String password = "123456";
        Class.forName(driver); //classLoader,加载对应驱动
        conn =  DriverManager.getConnection(url, username, password);
    }
    private void insertSql(List list) throws Exception{
        List list1 = new ArrayList();
        list1 = (List) list.get(3);
        String sql = "insert INTO ip_forecast (TEMPERATURE_VALUE,HUMIDITY_VALUE,SMOKE_VALUE,MING_RESULT,YIN_RESULT,WU_RESULT,ROOM_ID,CREATE_TIME,MODIFY_TIME) VALUES ('"+sensorValue[0]+"','"+sensorValue[1]+"','"+sensorValue[2]+"','"+list1.get(0)+"','"+list1.get(1)+"','"+list1.get(2)+"','"+list.get(4)+"',now(),now())";
        Statement st =  conn.createStatement();
        st.executeUpdate(sql);
    }
    private String selectSql(){
        String recordValue = "";
        int mark = 0;
        PreparedStatement pstmt;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String thisDate = df.format(new Date(System.currentTimeMillis()-9000));
        System.out.println(thisDate+"_____"+df.format(new Date()));
        String sql = "SELECT SENSOR_ID,RECORD_VALUE,CREATE_TIME FROM IP_RECORD WHERE CREATE_TIME = '"+thisDate+"' and (SENSOR_ID = 1 OR SENSOR_ID = 3 OR SENSOR_ID = 4) AND AREA_ID = 1";
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            int col = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                mark++;
                for (int i = 2; i <= col; i++) {
                    System.out.print(rs.getString(i)+"  ");
                    if(i==2){
                        double value = Double.parseDouble(rs.getString(i));
                        if(mark <=0){
                            mark = 1;
                        }
                        if(mark>=4){
                            mark = 3;
                        }
                        sensorValue[mark-1] = rs.getString(i);
                        value/=100;
                        if(mark !=3){
                            recordValue = recordValue+value+"!";
                        }
                        else{
                            recordValue = recordValue+value;
                        }
                    }
                }
                System.out.println();
                if (mark<3){
                    recordValue = "0.014!0.003!0.002";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return recordValue;
    }

}