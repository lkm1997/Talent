package net.Service;

import net.dao.UserDao;
import net.javabean.Client;
import net.javabean.Menu;
import net.javabean.Myfile;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
@Service
public class UserServiceImpl implements UserService
{
	//使用注解,完成自动装配的工作，也就是直接获取到userDao对象
	@Autowired
	private UserDao userDao;

	@Override
	public Client dologin(String user)
	{
		//后面所有的操作，都只需要调用userDao.方法名即可
		Client client = userDao.userLogin(user);
		return client;
	}

	@Override
	public Client doRegName(String account)
	{
		Client client = userDao.userLogin(account);
		return client;
	}

	@Override
	public int insertClient(Client client)
	{
		int sum = userDao.insertClient(client);
		return sum;
	}

	@Override
	public int allUserCount(String account, String startTime, String endTime)
	{
		int sum = userDao.allUserCount(account,startTime,endTime);
		return sum;
	}

	@Override
	public List<Client> allUser(String account, String startTime, String endTime, RowBounds rowBounds)
	{
		List<Client> alluser = userDao.allUser(account, startTime, endTime, rowBounds);
		return alluser;
	}

	@Override
	public int updateState(String account, int state)
	{
		int sum = userDao.updateState(account,state);
		return sum;
	}

	@Override
	public int allFileCount(String account, String filename)
	{
		int sum = userDao.allFileCount(account,filename);
		return sum;
	}

	@Override
	public List<Myfile> allFile(String account, String filename, RowBounds rowBounds)
	{
		List<Myfile> allfile = userDao.allFile(account, filename, rowBounds);
		return allfile;
	}

	@Override
	public List<Menu> allMenu(){
		List<Menu> list = userDao.allMenu();
		return list;
	}
	@Override
	public List<Menu> unMenu(){
		List<Menu> list = userDao.unMenu();
		return list;
	}

	@Override
	public int delMenu(List<Integer> inlist){
		int list = userDao.delMenu(inlist);

		return list;
	}

	@Override
	public int addMenu(List<Integer> inlist){
		int list = userDao.addMenu(inlist);
		return list;
	}
}
