package com.li.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class BaseDao {

	private static final String dirver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/eprinter?characterEncoding=utf-8";
	private static final String username = "root";
	private static final String password = "liyajian";
	private Connection con ;
	private PreparedStatement pst;
	private ResultSet rs;
	
	//打开数据库连接
	public Connection openConnection(){
		
		try {
			//注册驱动
			Class.forName(dirver);
			//获取连接
			con = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	//执行查询
	public ResultSet executeQuery(String sql ,Object [] params){
		//打开连接
		openConnection();
		try {
			//装载SQL语句
			
			pst = con.prepareStatement(sql);
			//配置SQL数据
			for (int i = 0; i < params.length; i++) {
				pst.setObject(i+1, params[i]);
			}
			//执行查询语句  rs 对查询出来的数据集 进行接收
			rs = pst.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//将查询到的数据进行返回
		return  rs;
	}
	/*public static void main(String[] args) {
		BaseDao t=new BaseDao();
		String sql=null;
		try{
			sql="select * from user where ID=1";
			t.executeQuery(sql,new Object[] {});
			
			ResultSet r=t.executeQuery(sql,new Object[] {});
			while(r.next()){
				System.out.print(r.getString("USERNAME")+"-");
				System.out.print(r.getString("PASSWORD")+"-");
				
			}
			System.out.println("--------");	
		}catch(Exception e){
			e.printStackTrace();
			try{
				t.con.rollback();
				
			}catch(SQLException e1){
				e1.printStackTrace();
			}
		}finally{
			try{
				t.con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		

	}*/
	//关闭数据库连接，关闭顺序不能错 ResultSet → PreparedStatement → Connection
	public void CloseAll(ResultSet rs,PreparedStatement pst,Connection con){
		
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pst != null){
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			if(con != null && !con.isClosed()){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
