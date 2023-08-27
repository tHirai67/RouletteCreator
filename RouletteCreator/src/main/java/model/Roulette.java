package model;

import java.util.Date;

public class Roulette {
    private int id;
    private String rouletteName;
    private Date date;

    public Roulette(int id, String rouletteName, Date date) {
        this.id = id;
        this.rouletteName = rouletteName;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public String getRouletteName() {
        return rouletteName;
    }

    public Date getDate() {
        return date;
    }
}
