package net.javabean;


public class Menu {

  private long id;
  private String menuname;
  private long menuid;
  private long fatherid;
  private String fathername;


  public long getid() {
    return id;
  }

  public void setid(long id) {
    this.id = id;
  }

  public String getMenuname()
  {
    return menuname;
  }

  public void setMenuname(String menuname)
  {
    this.menuname = menuname;
  }

  public String getFathername()
  {
    return fathername;
  }

  public void setFathername(String fathername)
  {
    this.fathername = fathername;
  }

  public long getmenuid() {
    return menuid;
  }

  public void setmenuid(long menuid) {
    this.menuid = menuid;
  }


  public long getfatherid() {
    return fatherid;
  }

  public void setfatherid(long fatherid) {
    this.fatherid = fatherid;
  }


}
