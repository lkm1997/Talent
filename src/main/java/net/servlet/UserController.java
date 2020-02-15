package net.servlet;

import com.google.gson.Gson;
import lombok.var;
import net.Service.UserService;
import net.javabean.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.RowBounds;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/user")
@SessionAttributes(value = {"user"})
public class UserController
{

	@Autowired
	private UserService userservice;

	@RequestMapping("/dologin")
	public @ResponseBody String dologin(String account, String password, HttpServletRequest request)
	{
		String result = "";
		Client client = userservice.dologin(account);

		if (client != null)
		{
			if (client.getPassword().equals(password))
			{
				System.out.println(client.getAccount());
				result ="true";
				request.getSession().setAttribute("user",client);
			} else
			{
				result = "nopwd";
			}
		}else{
			result = "noname";
		}
		return result;
	}

	@RequestMapping("/doRegName")
	public @ResponseBody String doRegName(String account)
	{

		boolean result = false;
		Client client = userservice.doRegName(account);
		if (client==null){
			result = true;
		}
		return String.valueOf(result);
	}

	@RequestMapping("/doreg")
	public String doreg(Client client)
	{

		if (userservice.insertClient(client)>0)
		{
			System.out.println("success");
			//转发 某一个页面
		}
		return "front/jsp/login";
	}

	@RequestMapping("/getAllUser")
	//查询所有用户
	public @ResponseBody String getAllUser(String account,String times,int page,int limit)
	{

		String[] timelist=new String[2];
		String startTime = "";
		String endTime ="";
		if(times!=null && times.length()==3){
			timelist = times.split(" ");
			startTime = timelist[0].trim();
			endTime =timelist[2].trim();
		}
		//分页
		RowBounds rowBounds = new RowBounds(page-1, limit);
		int count = userservice.allUserCount(account,startTime,endTime);
		List<Client> list = userservice.allUser(account,startTime,endTime,rowBounds);

		LayuiDate date = new LayuiDate();
		date.setCode(0);
		date.setCount(count);
		date.setData(list);
		String s = new Gson().toJson(date);
		return s;
	}

	@RequestMapping("/updateState")
	public @ResponseBody String updateState(String account,int statusid) throws SQLException, IOException
	{
		int s = userservice.updateState(account,statusid);

		String res = "false";
		if (s>0){
			res = "true";
		}
		return res;

	}


	@RequestMapping(value = "/getDocList" ,produces="text/plain;charset=UTF-8")
	//前台用户登录后，进行该用户下的所有文件的返回
	public @ResponseBody String getDocList(HttpServletRequest request,int page,int limit,String filename) throws SQLException, IOException
	{
		String account = "";
		//当传上来的all属性为all时，为全查
		if(request.getParameter("all").equals("no")){
			Client client = (Client) request.getSession().getAttribute("user");
			account = client.getAccount();
		}

		RowBounds rowBounds = new RowBounds(page-1, limit);
		int count = userservice.allFileCount(account,filename);
		List<Myfile> list = userservice.allFile(account,filename,rowBounds);
		LayuiDate date = new LayuiDate();
		date.setCode(0);
		date.setCount(count);
		date.setData(list);
		String s = new Gson().toJson(date);
		return s;
	}

	@RequestMapping("/uploadfile")
	//文件上传
	public @ResponseBody String uploadfile(@RequestParam("file") MultipartFile file,Myfile myfile)
	{
		String s = "";
		try
		{
			String filename = file.getOriginalFilename();
			file.transferTo(new File(""+filename));
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return s;
	}

	@RequestMapping("/menumanger")
	public @ResponseBody Object menumanger(){

		List<MenuLayui> layui = new ArrayList<>();
		List<Menu> treeList = userservice.allMenu();
		layui = List2TreeUtil.getDtoTreeList(treeList);
		for (int i = 0; i < layui.size(); i++)
		{
			if (layui.get(i).getChildren()==null){
				layui.remove(layui.get(i));
				i--;
			}
		}
		return layui;
	}

	@RequestMapping("/unmenu")
	public @ResponseBody Object unmenu(){

		List<Menu> treeList = userservice.unMenu();
		List<MenuLayui> layuiList = List2TreeUtil.getDtoTreeList(treeList);

		for (int i = 0; i < layuiList.size(); i++)
		{
			if (layuiList.get(0).getChildren()==null){
				layuiList.remove(layuiList.get(0));
				i--;
			}
		}
		return layuiList;
	}


	@RequestMapping("/delmenu")
	@ResponseBody
	public String delmenu(@RequestBody List<MenuLayui> list){
		List<Integer> inlist = new ArrayList<>();
		for (int i = 0; i < list.size() ; i++)
		{
			for (MenuLayui menuLayui : list.get(i).getChildren()) {
				inlist.add(menuLayui.getId());
			}
		}

		int s = userservice.delMenu(inlist);
		return s+"";
	}

	@RequestMapping("/addmenu")
	public @ResponseBody String addmenu(@RequestBody List<MenuLayui> list)
	{
		List<Integer> inlist = new ArrayList<>();
		for (int i = 0; i < list.size() ; i++)
		{
			for (MenuLayui menuLayui : list.get(i).getChildren()) {
				inlist.add(menuLayui.getId());
			}
		}
		int s = userservice.addMenu(inlist);
		return s+"";
	}
}
