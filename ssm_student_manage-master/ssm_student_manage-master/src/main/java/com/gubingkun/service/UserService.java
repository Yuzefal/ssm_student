package com.gubingkun.service;

import com.gubingkun.domain.User;

public interface UserService {

    public void registerUser(String username, String password);

    public User findUsernameAndPassword(User user);
}
