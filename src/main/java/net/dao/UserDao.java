package net.dao;

import net.javabean.Client;
import net.javabean.Menu;
import net.javabean.Myfile;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import javax.xml.ws.soap.Addressing;
import java.util.HashMap;
import java.util.List;

//使用注解，将这个DAO交給Spring管理，其目的就是为了不再写mapper映射，也就是那些bean
@Mapper
public interface UserDao
{
	/**
	 * 	 用户登录
	 */
	public Client userLogin(String account);
	/**
	 *   用户注册
	 */
	public int insertClient(Client client);
	/**
	 * 	管理员查找所有用户
	 */
	public int allUserCount(@Param("account") String account, @Param("startTime") String startTime, @Param("endTime") String endTime);
	public List<Client> allUser(@Param("account") String account, @Param("startTime") String startTime, @Param("endTime") String endTime, RowBounds rowBounds);
	/**
	 *   	管理员更新用户状态
	 */
	public int updateState(@Param("account") String account, @Param("state") int state);
	/**
	 *   	查用户下的文档
	 */
	public int allFileCount(@Param("account") String account, @Param("filename") String filename);
	public List<Myfile> allFile(@Param("account") String account, @Param("filename") String filename, RowBounds rowBounds);

	public List<Menu> allMenu();
	public List<Menu> unMenu();
	public int delMenu(@Param("dellist") List<Integer> inlist);
	public int addMenu(@Param("addlist") List<Integer> inlist);
}
