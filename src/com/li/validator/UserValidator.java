package com.li.validator;
import org.springframework.validation.Errors;  
import org.springframework.validation.ValidationUtils;  
import org.springframework.validation.Validator; 
import com.li.entity.*;
   
public class UserValidator implements Validator {  
   
    public boolean supports(Class User) { 
    	
       // TODO Auto-generated method stub  
       return User.class.equals(User);  
    }  
   
    public void validate(Object obj, Errors errors) {  
       // TODO Auto-generated method stub  
       ValidationUtils.rejectIfEmpty(errors, "username", null, "Username is empty.");  
       User user = (User) obj;  
       if (null == user.getPassword() || "".equals(user.getPassword()))  
           errors.rejectValue("password", null, "Password is empty.");  
    }  
   
}  