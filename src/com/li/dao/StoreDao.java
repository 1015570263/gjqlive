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
import com.li.entity.Store;
import com.li.entity.Comment;
import com.li.model.*;
  
  
public class StoreDao {  
//获取Session  
public Session getSession(){  
return HibernateSessionFactory.getSession();  
} 
public List findStore(){
	  List list = new ArrayList();
	  String hql = "from Store as u order by summ  asc, px asc,tj desc";
	  Session session=getSession();
	  session.flush();
	  Query query = session.createQuery(hql);
	  list= query.list();
	 //返回的是一个集合
	  session.close();
	  return list;
	 } 

public List findCommentBySid(int value){
	  List list = new ArrayList();
	  String hql = "from Comment as u where u.sid="+value;
	  Session session=getSession();
	  session.flush();
	  Query query = session.createQuery(hql);
	  list= query.list();
	 //返回的是一个集合
	  session.close();
	  return list;
	 }

public void saveStore(Store transientInstance){
	Session session=getSession();
	Transaction tx=session.beginTransaction();//事务开始  
	getSession().save(transientInstance);  
	tx.commit();
	session.close();
	} 

public void updateStorepx(int value,int value1){  
	Transaction tx=getSession().beginTransaction();//事务开始  
    Query query = getSession().createQuery("update Store t set t.px ="+value1+" where sid = "+value);
    getSession().clear();
    query.executeUpdate();
    tx.commit();
    getSession().close();
    
}

public void updateStoretj(int value,int value1){  
	Transaction tx=getSession().beginTransaction();//事务开始  
    Query query = getSession().createQuery("update Store t set t.tj ="+value1+" where sid = "+value); 
    getSession().clear();
    query.executeUpdate(); 
    tx.commit();
    getSession().close();
    
}
public  Store findStoreById(int id) {
    Session session = HibernateSessionFactory.getSession();
    Store store = (Store) session.get(Store.class, id);
    return store;
}
public void updateStore(int value,String value1,String value2,int value3,String value5,String value6){  
	Transaction tx=getSession().beginTransaction();//事务开始  
    Query query = getSession().createQuery("update Store t " +
    		"set t.storename ='"+value1+"', t.address='"+value2+
    		"',t.lid="+value3+
    		", t.context='"+value5+"', t.photo='"+value6+"' where sid = "+value); 
    getSession().clear();
    query.executeUpdate(); 
    tx.commit();
    getSession().close();
}
public void updateStore1(int value,String value1,String value2,int value3,String value5){
	Session session=getSession();
	Transaction tx=session.beginTransaction();//事务开始
    Query query = session.createQuery("update Store t " +
    		"set t.storename ='"+value1+"', t.address='"+value2+
    		"',t.lid="+value3+
    		", t.context='"+value5+"' where sid = "+value);  
    query.executeUpdate(); 
    tx.commit();
    session.flush();
    session.close();
}
public  void  removeStore(int id) {
	Session session=getSession();
	Transaction tx=session.beginTransaction();//事务开始  
	Store store = (Store) session.get(Store.class, id);
	 session.flush();
    session.delete(store);
     tx.commit();
    session.close();
}
public  void  removeComment(int id) {
	Session session=getSession();
	Transaction tx=session.beginTransaction();//事务开始  
	Comment comment = (Comment) session.get(Comment.class, id);
	 session.flush();
    session.delete(comment);
     tx.commit();
    session.close();
}
}