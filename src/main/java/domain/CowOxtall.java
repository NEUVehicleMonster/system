package domain;

public class CowOxtall {

    private int id;
    private int cow_id;
    private int oxtall_id;
    private Oxtall oxtall;

    public Oxtall getOxtall() {
        return oxtall;
    }

    public void setOxtall(Oxtall oxtall) {
        this.oxtall = oxtall;
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
}
