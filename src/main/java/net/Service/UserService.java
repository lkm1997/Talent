package net.Service;

import net.javabean.Client;
import net.javabean.Menu;
import net.javabean.Myfile;
import org.apache.ibatis.session.RowBounds;

import java.util.HashMap;
import java.util.List;

//该类是Service的接口类，其实可以发现该类和UserDao类基本一样，
//其实是可以省略该类直接写实现类的，但是如果工程大或者为了规范性
//建议多写一个此类

public interface UserService
{
	//登录
	public Client dologin(String user);
	//注册名字是否重复
	public Client doRegName(String account);

	//注册
	public int insertClient(Client client);
	//管理员查找所有用户
	public int allUserCount(String account,String startTime, String endTime);
	public List<Client> allUser(String account,  String startTime,String endTime, RowBounds rowBounds);

	//管理员更新用户状态
	public int updateState(String account,int state);

	//查用户下的文档
	public int allFileCount(String account,String filename);
	public List<Myfile> allFile( String account, String filename, RowBounds rowBounds);

	//菜单权限管理
	public List<Menu> allMenu();
	public List<Menu> unMenu();
	public int delMenu(List<Integer> inlist);
	public int addMenu(List<Integer> inlist);
}
