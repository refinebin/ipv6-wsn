package com.room.receive.util;

import java.io.IOException;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

/**
 * Created by 12:29 on 2019/1/24
 *
 * @author wenbai
 * 24099
 */
public class IpUtil {


    public static String getLocalIPv6Address() throws IOException {
        InetAddress inetAddress = null;
        Enumeration<NetworkInterface> networkInterfaces = NetworkInterface
                .getNetworkInterfaces();
        outer:
        while (networkInterfaces.hasMoreElements()) {
            Enumeration<InetAddress> inetAds = networkInterfaces.nextElement()
                    .getInetAddresses();
            while (inetAds.hasMoreElements()) {
                inetAddress = inetAds.nextElement();
                //Check if it's ipv6 address and reserved address
                if (inetAddress instanceof Inet6Address
                        && !isReservedAddr(inetAddress)) {
                    break outer;
                }
            }
        }

        String ipAddr = inetAddress.getHostAddress();
        // Filter network card No
        int index = ipAddr.indexOf('%');
        if (index > 0) {
            ipAddr = ipAddr.substring(0, index);
        }

        return ipAddr;
    }

    /**
     * Check if it's "local address" or "link local address" or
     * "loopbackaddress"
     *
     * @param ip address
     *
     * @return result
     */
    private static boolean isReservedAddr(InetAddress inetAddr) {
        if (inetAddr.isAnyLocalAddress() || inetAddr.isLinkLocalAddress()
                || inetAddr.isLoopbackAddress()) {
            return true;
        }

        return false;
    }
}
