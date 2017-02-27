package com.li.dao;  
import java.util.ArrayList;
import java.util.List;  
import org.hibernate.Query;  
import org.hibernate.Session;  
import org.hibernate.Transaction;  
import com.li.session.HibernateSessionFactory;  
import com.li.entity.User;
import com.li.entity.School;
import com.li.entity.About;
import com.li.model.*;
  
  
public class UserDao {  
//获取Session  
public Session getSession(){  
return HibernateSessionFactory.getSession();  
}  
//保存对象  
public void save(User transientInstance){  
Transaction tx=getSession().beginTransaction();//事务开始  
getSession().save(transientInstance);  
tx.commit();
getSession().close();
}  
//由属性获取对象  
public List findByProperty(String propertyName,Object value){  
String queryString="from User as model where model."+propertyName+"=?";  
Query queryObject=getSession().createQuery(queryString);//使用query接口  
queryObject.setParameter(0, value);  
return queryObject.list();

}
public List findSchool(){
	  List list = new ArrayList();
	  String hql = "from School as u order by  px asc,tj desc";
	  Session session=getSession();
	  session.flush();
	  Query query = session.createQuery(hql);
	  list= query.list();
	 //返回的是一个集合
	  session.close();
	  return list;
	 }   

public void saveSchool(School transientInstance){
	Session session=getSession();
	Transaction tx=session.beginTransaction();//事务开始  
	getSession().save(transientInstance);  
	tx.commit();
	session.close();
	} 

public void updateSchoolpx(int value,int value1){  
	Transaction tx=getSession().beginTransaction();//事务开始  
    Query query = getSession().createQuery("update School t set t.px ="+value1+" where sid = "+value);
    getSession().clear();
    query.executeUpdate();
    tx.commit();
   
   getSession().close();
    
} 
public void updateSchooltj(int value,int value1){  
	Transaction tx=getSession().beginTransaction();//事务开始  
    Query query = getSession().createQuery("update School t set t.tj ="+value1+" where sid = "+value); 
    getSession().clear();
    query.executeUpdate(); 
    tx.commit();
    getSession().close();
    
} 
public void updateAboutcontent(int value,String value1){  
	Transaction tx=getSession().beginTransaction();//事务开始  
    Query query = getSession().createQuery("update About t set t.content ='"+value1+"' where id = "+value); 
    getSession().clear();
    query.executeUpdate(); 
    tx.commit();
    getSession().flush();
    getSession().close();
    
} 
public  School findSchoolById(int id) {
    Session session = HibernateSessionFactory.getSession();
    School school = (School) session.get(School.class, id);
    return school;
}

public  User findUserById(int id) {
    Session session = HibernateSessionFactory.getSession();
    User user = (User) session.get(User.class, id);
    return user;
}
public  About findAboutById(int id) {
    Session session = HibernateSessionFactory.getSession();
    session.flush();
    About about = (About) session.get(About.class, id);
    session.close();
    return about;
}
public void updateSchool(int value,String value1,String value2,String value3,String value4,String value5,String value6){  
	Transaction tx=getSession().beginTransaction();//事务开始  
    Query query = getSession().createQuery("update School t " +
    		"set t.name ='"+value1+"', t.saddress='"+value2+
    		"', t.baddress='"+value3+"', t.laddress='"+value4+
    		"', t.content='"+value5+"', t.sic='"+value6+"' where sid = "+value); 
    getSession().clear();
    query.executeUpdate(); 
    tx.commit();
    getSession().close();
}
public void updateSchool1(int value,String value1,String value2,String value3,String value4,String value5){
	Session session=getSession();
	Transaction tx=session.beginTransaction();//事务开始
    Query query = session.createQuery("update School t " +
    		"set t.name ='"+value1+"', t.saddress='"+value2+
    		"', t.baddress='"+value3+"', t.laddress='"+value4+
    		"', t.content='"+value5+"' where sid = "+value);  
    query.executeUpdate(); 
    tx.commit();
    session.flush();
    session.close();
}
public void updateUser(int value,String value1){
	Session session=getSession();
	Transaction tx=session.beginTransaction();//事务开始
    Query query = session.createQuery("update User t " +
    		"set t.password ='"+value1+"' where id = "+value);  
    query.executeUpdate(); 
    tx.commit();
    session.flush();
    session.close();
}
public  void  removeSchool(int id) {
	Session session=getSession();
	Transaction tx=session.beginTransaction();//事务开始  
	School school = (School) session.get(School.class, id);
	 session.flush();
    session.delete(school);
     tx.commit();
    session.close();
}
}  