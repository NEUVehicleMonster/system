package domain;

public class
Cow {

    private int id;
    private double  weight;//体重
    private String   var;//品种
    private int  age;//牛龄
    private String  yield;//产量
    private String  period;//周期
    private Integer  grade;//评级代码0，1，2，3／优良中差
    private String  node;//奶牛编号
    private String  gradeStr;//奶牛评级
    private int oxtall_id;//牛舍编号


    public int getOxtall_id() {
        return oxtall_id;
    }

    public void setOxtall_id(int oxtall_id) {
        this.oxtall_id = oxtall_id;
    }

    public String getGradeStr() {
        if(grade!=null){
            if (grade==0){
                gradeStr = "优";
                return gradeStr;
            }else if (grade==1){
                gradeStr = "良";
                return gradeStr;
            }else if (grade==2){
                gradeStr = "中";
                return gradeStr;
            }else if (grade==3){
                gradeStr = "差";
                return gradeStr;
            }

        }
        return gradeStr;

    }

    public void setGradeStr(String gradeStr) {
        this.gradeStr = gradeStr;
    }

    public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getVar() {
        return var;
    }

    public void setVar(String var) {
        this.var = var;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getYield() {
        return yield;
    }

    public void setYield(String yield) {
        this.yield = yield;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
}
