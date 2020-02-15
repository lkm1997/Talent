package net.javabean;

import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * 将数据库查出来的list数据抓成树状结构
 * @author zgd
 */
public class List2TreeUtil {

	/**
	 * 根级父ID
	 */
	private static final String ROOT_PARENT_ID = "0";

	/**
	 * 将普通的entity的集合转成存在树状结构的集合
	 * @param list
	 * @return
	 */
	public static List<MenuLayui> getDtoTreeList(List<Menu> list){
		List<MenuLayui> dtos = new ArrayList<>();
		if (list == null || list.isEmpty()) {
			return dtos;
		}
		for (Menu menu : list) {
			if (ROOT_PARENT_ID.equals(menu.getfatherid()+"")){
				//找到顶层目录
				MenuLayui menuLayui = new MenuLayui();
				//将实体类的数据转成dto
				menuLayui.setId((int) menu.getmenuid());
				menuLayui.setTitle(menu.getMenuname());
//				BeanUtils.copyProperties(menu,menuLayui);
				//获取该实体类下的所有子级
				dtos.add(findChildren(menuLayui,list));
			}
		}
		return dtos;
	}

	/**
	 * 获取dto类下面的所有子级,存到dto中的children中
	 * @return
	 */
	private static MenuLayui findChildren(MenuLayui menuLayui, List<Menu> list) {
		for (Menu menu : list) {
			if (menuLayui.getId()==(menu.getfatherid())){
				//此时menu是menuDto下的子级
				if (menuLayui.getChildren() == null){
					menuLayui.setChildren(new ArrayList<MenuLayui>());
				}
				MenuLayui mlayui = new MenuLayui();
				mlayui.setId((int) menu.getmenuid());
				mlayui.setTitle(menu.getMenuname());
//				BeanUtils.copyProperties(menu,menuLayui);
				//递归
				menuLayui.getChildren ().add(findChildren(mlayui,list));
			}
		}
		return menuLayui;
	}

}

