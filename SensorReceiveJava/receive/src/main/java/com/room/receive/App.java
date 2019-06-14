package com.room.receive;

import com.room.receive.thread.ReceiveThread;

import java.io.IOException;

/**
 * Hello world!
 * @author liangjh
 */
public class App 
{
    public static void main( String[] args ) throws IOException {

        System.setProperty("java.net.preferIPv6Addresses","true");
        System.setProperty("java.net.preferIPv4Stack","false");
        ReceiveThread receiveThread = new ReceiveThread();
        receiveThread.start();
        //阻塞程序
        System.in.read();
    }
}
