package com.gubingkun.controller;

import com.gubingkun.domain.User;
import com.gubingkun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 登陆
     * */
    @RequestMapping("/login")
    public ModelAndView login(User user, String checkCode, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        String checkCode_session = (String) session.getAttribute("checkCode_session");
        session.removeAttribute("checkCode_session");
        //判断验证码
        if (checkCode_session != null && checkCode_session.equalsIgnoreCase(checkCode)) {
            User user1 = userService.findUsernameAndPassword(user);
            if (user1 == null) {
                modelAndView.addObject("login_error", "用户名密码错误");
                modelAndView.setViewName("/login.jsp");
                return modelAndView;
            } else {
                //登录成功 获取用户是否勾选了保存用户名
                String check_user = request.getParameter("check_user");
                //获取用户是否勾选了自动登陆
                String check_auto = request.getParameter("check_auto");
                if ("true".equalsIgnoreCase(check_user)) {
                    //说明用户勾选了记住用户名
                    //将用户名保存到Cookie中
                    Cookie cookie_uu = new Cookie("uu_name", user1.getUsername());
                    cookie_uu.setMaxAge(60 * 60 * 24 * 7);
                    cookie_uu.setPath(request.getContextPath());
                    response.addCookie(cookie_uu);
                }
                if ("true".equalsIgnoreCase(check_auto)){
                    //说明用户勾选了自动登陆
                    //将用户名和密码保存到Cookie
                    Cookie cookie_auto = new Cookie("auto_login", user1.getUsername() + "#" + user1.getPassword());
                    cookie_auto.setMaxAge(60*60*24*7);
                    cookie_auto.setPath(request.getContextPath());
                    response.addCookie(cookie_auto);
                }
                //将用户信息存入session
                session.setAttribute("user1",user1);
                modelAndView.setViewName("/index.jsp");
                return modelAndView;
            }

        }else {
            session.setAttribute("cc_error","验证码错误");
            modelAndView.setViewName("redirect:/login.jsp");
            return modelAndView;
        }

    }
    /**
     * 注册
     * */
    @RequestMapping("/register")
    public ModelAndView register(ModelAndView modelAndView,String username, String password){
        if (username==null||username.equals("")&&password==null||password.equals("")){
            //如果用户名为空 返回错误消息
            modelAndView.addObject("error","用户名或密码为空");
            modelAndView.setViewName("forward:/error.jsp");
            return modelAndView;
        }
        userService.registerUser(username,password);
        modelAndView.setViewName("forward:/login.jsp");
        return modelAndView;
    }



    /**
     * 验证码
    * */
    @RequestMapping("/checkCode")
    public void CheckCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");

        //在内存中创建一个长100，宽40的图片，默认黑色背景
        //参数一：长
        //参数二：宽
        //参数三：颜色
        int width = 100;
        int height = 40;
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

        //获取画笔
        Graphics g = image.getGraphics();
        //设置画笔颜色为灰色
        g.setColor(Color.GRAY);
        //填充图片
        g.fillRect(0,0, width,height);

        //产生4个随机验证码，12Ey
        String checkCode_session = getCheckCode();
        //将验证码放入HttpSession中
        request.getSession().setAttribute("checkCode_session",checkCode_session);

        //设置画笔颜色为黄色
        g.setColor(Color.YELLOW);
        //设置字体的小大
        g.setFont(new Font("黑体", Font.BOLD,26));
        //向图片上写入验证码
        g.drawString(checkCode_session,25,30);

        //将内存中的图片输出到浏览器
        //参数一：图片对象
        //参数二：图片的格式，如PNG,JPG,GIF
        //参数三：图片输出到哪里去
        ImageIO.write(image,"PNG",response.getOutputStream());
    }
    /**
     * 产生4位随机字符串
     */
    private String getCheckCode() {
        String base = "0123456789ABCDEFGabcdefg";
        int size = base.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=1;i<=4;i++){
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = base.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        return sb.toString();
    }





}
