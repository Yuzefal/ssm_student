package com.gubingkun.dao;


import com.gubingkun.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    @Insert("insert into user values(null,#{username},#{password})")
    public  void registerUser(@Param("username")String username, @Param("password")String password);


    @Select("select * from user where username = #{username} and password = #{password}")
    User findUsernameAndPassword(User user);
}
