

package houseOp;

/**
 *
 * @author yannis bitsikokos
 */
public class House {
    
    private int id;
    private int price;
    private String place;
    private int area_size;
    private int house_or_appartment;
    private int shared;
    private int year;
    private int heat;
    private String description;
    private double lng;
    private double lat;
    private String info;

    
    public House()
    {
        id = 0;
        price = 0;
        place = "";
        area_size = 0;
        house_or_appartment = 0;
        shared = 0;
        year = 0;
        heat = 0;
        description = "";
        lng = 0;
        lat = 0;
        info = "";
    }
    
    public House(int house_id, int pr, String pl, int area, int h_ap, int sh, int y, int he, String desc, double ln, double la, String inf)
    {
        id = house_id;
        price = pr;
        place = pl;
        area_size = area;
        house_or_appartment = h_ap;
        shared = sh;
        year = y;
        heat = he;
        description = desc;
        lng = ln;
        lat = la;
        info = inf;
    }
     
    public void setId(int house_id)
    {
        id = house_id;
    }
    public int getId()
    { 
        return id; 
    }
    
    public void setPrice(int p)
    {
        price = p;
    }
    public int getPrice()
    { 
        return price; 
    }
    
    public void setPlace(String pl)
    {
        place = pl;
    }
    public String getPlace()
    { 
        return place; 
    }
    
    public void setAreaSize(int area)
    {
        area_size = area;
    }
    public int getAreaSize()
    { 
        return area_size; 
    }
    
    public void setHouseAppartment(int h_ap)
    {
        house_or_appartment = h_ap;
    }
    public int getHouseAppartment()
    { 
        return house_or_appartment; 
    }
    
    public void setShared(int sh)
    {
        shared = sh;
    }
    public int getShared()
    { 
        return shared; 
    }
    public void setYear(int y)
    {
        year = y;
    }
    public int getYear()
    { 
        return year; 
    }
    
    public void setHeat(int he)
    {
        heat = he;
    }
    public int getHeat()
    { 
        return heat; 
    }
    public void setDescription(String desc)
    {
        description = desc;
    }
    public String getDescription()
    { 
        return description; 
    }
    public void setLng(double ln)
    {
        lng = ln;
    }
    public double getLng()
    { 
        return lng; 
    }
    
    public void setLat(double la)
    {
        lat = la;
    }
    public double getLat()
    { 
        return lat; 
    }
    
    public void setInfo(String inf)
    {
        info = inf;
    }
    public String getInfo()
    { 
        return info; 
    }
    
}
