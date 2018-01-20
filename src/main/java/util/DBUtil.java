package util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBUtil {

	static SqlSessionFactory sqlSessionFactory;
	static{
		String resource = "mybatis.xml";//ע�⣺����д��classpath:mybatis.xml
		InputStream inputStream=null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
	}
	public static SqlSessionFactory findSqlSession(){
		return sqlSessionFactory;
	}
	/*//�����Ƿ�õ�sqlSessionFactory��sqlSession����
	public static void main(String[] args){
		System.out.println(sqlSessionFactory);//org.apache.ibatis.session.defaults.DefaultSqlSessionFactory@3cda1055
		System.out.println(findSqlSession());//org.apache.ibatis.session.defaults.DefaultSqlSessionFactory@3cda1055
		System.out.println(findSqlSession().openSession());//org.apache.ibatis.session.defaults.DefaultSqlSession@246ae04d
	}*/
}
