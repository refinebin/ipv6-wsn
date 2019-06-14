package com.polaris.service;

import java.io.IOException;

public interface LoginService {
    int checkPassword(String username,String passwd) throws IOException;
}
