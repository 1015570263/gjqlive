package com.li.action;
import java.sql.SQLException;

import java.util.Iterator;

import java.util.List;

import com.li.dao.*;
import com.li.entity.User;
import com.li.model.*;;
public class hebernatetest {  
public static void main(String[] args) {
	String username="admin";  
    String password="123";  
    UserDao md=new UserDao();  
    User m=new User();  
    //封装  
    m.setUsername(username);  
    m.setPassword(password);  
    //调用方法，保存对象  
    md.save(m);  
    //从数据库中加载类对象  
    System.out.println("连接成功");  
    List l=null;  
    l=(List) md.findByProperty("username",username);  
    Iterator i=l.iterator();  
    
    if(i.hasNext()){  
     m=(User)i.next();  
     System.out.println("对的");  
    
    }else{  
    	 System.out.println("错的");  
    }  
		

	}}