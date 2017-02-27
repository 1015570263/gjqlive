package com.li.action;  
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import org.springframework.stereotype.Controller;  
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

import java.util.List;

import com.li.dao.*;
import com.li.entity.User;
@Controller
public class loginAction {
    
    @RequestMapping("/login")
    public String login(HttpServletRequest request){
        String username = request.getParameter("username");
        request.setAttribute("username", username); 
        String password = request.getParameter("password");
		 UserDao md=new UserDao();  
	     User m=new User();  
	     //封装  
	     m.setUsername(username);  
	     m.setPassword(password);  
	     //调用方法，保存对象  
	    
	    
	     List l=null;  
	     l=(List) md.findByProperty("username",username);  
	     Iterator i=((java.util.List) l).iterator();  
	   
	     if(i.hasNext()){  
	      m=(User)i.next();  
	      return "Default";
	     }else{  
	    	  return "loginError";  
	     }  
    	
    }    
}