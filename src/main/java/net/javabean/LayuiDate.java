package net.javabean;

import java.util.List;

public class LayuiDate
{

	private int code=0;
	private String msg = "";
	private int count=0;
	private List<?> data;

	public void setCode(int code)
	{
		this.code = code;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public void setData(List<?> data)
	{
		this.data = data;
	}

	public int getCode()
	{
		return code;
	}

	public String getMsg()
	{
		return msg;
	}

	public int getCount()
	{
		return count;
	}

	public List<?> getData()
	{
		return data;
	}
}
