package net.javabean;

import java.util.List;

public class MenuLayui
{
	private String title;
	private int id;
	private List<MenuLayui> children;
	private boolean spread = true;

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public List<MenuLayui> getChildren()
	{
		return children;
	}

	public void setChildren(List<MenuLayui> children)
	{
		this.children = children;
	}
}
