package com.gubingkun.service.impl;

import com.gubingkun.dao.UserDao;
import com.gubingkun.domain.User;
import com.gubingkun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void registerUser(String username, String password) {

        userDao.registerUser(username,password);
    }

    @Override
    public User findUsernameAndPassword(User user) {
        return userDao.findUsernameAndPassword(user);
    }
}
