package com.li.validator;
import org.springframework.stereotype.Controller;  
import org.springframework.validation.BindingResult;  
import org.springframework.validation.DataBinder;  
import org.springframework.web.bind.annotation.InitBinder;  
import org.springframework.web.bind.annotation.RequestMapping;  
import com.li.entity.*;



   
@Controller  
public class UserController {  
     
    @InitBinder  
    public void initBinder(DataBinder binder) { 
    	//setValidator报错，blind中无此方法
    	//binder.setValidator(new UserValidator());  
    }  
   
  //  @RequestMapping("/login")
    //@Valid报错，需要导入import javax.validation.Valid;
//    public String login(@Valid User user, BindingResult result) {  
//       if (result.hasErrors())  
//           return "loginError";  
//       return "Default";  
//    }  
     
}  