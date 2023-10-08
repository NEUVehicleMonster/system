package domain;

import utils.DateUtils;

import java.util.Date;
import java.util.List;

public class Feed {
    private int id;
    private int cow_id;
    private int oxtall_id;
    private int fodder_id;
    private double uselevel;
    private double total;
    private String username;
    private Date timelog;
    private List<Cow> cows;
    private List<Fodder> fodders;
    private String timelogStr;


    public String getTimelogStr() {
        if(timelog!=null){
            timelogStr= DateUtils.date2String(timelog,"yyyy-MM-dd HH:mm");
        }
        return timelogStr;
    }

    public void setTimelogStr(String timelogStr) {
        this.timelogStr = timelogStr;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCow_id() {
        return cow_id;
    }

    public void setCow_id(int cow_id) {
        this.cow_id = cow_id;
    }

    public int getOxtall_id() {
        return oxtall_id;
    }

    public void setOxtall_id(int oxtall_id) {
        this.oxtall_id = oxtall_id;
    }

    public int getFodder_id() {
        return fodder_id;
    }

    public void setFodder_id(int fodder_id) {
        this.fodder_id = fodder_id;
    }

    public double getUselevel() {
        return uselevel;
    }

    public void setUselevel(double uselevel) {
        this.uselevel = uselevel;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getTimelog() {
        return timelog;
    }

    public void setTimelog(Date timelog) {
        this.timelog = timelog;
    }

    public List<Cow> getCows() {
        return cows;
    }

    public void setCows(List<Cow> cows) {
        this.cows = cows;
    }

    public List<Fodder> getFodders() {
        return fodders;
    }

    public void setFodders(List<Fodder> fodders) {
        this.fodders = fodders;
    }
}
