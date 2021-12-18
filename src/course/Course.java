package course;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : course
 * @ClassName : Course.java
 * @createTime : 2021/12/16 19:47
 * @Email : 874280179@qq.com
 * @Description :
 */
public class Course {
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }


    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public int getSelected() {
        return selected;
    }

    public void setSelected(int selected) {
        this.selected = selected;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    private int id;
    private String name;
    private String info;
    private String professional;
    private String term;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    private int total;
    private String kind;
    private int selected;
    private int pId;
    public Course(int id,String name,String info,String professional,String term,int total,String kind,int selected,int pId){
        this.id=id;
        this.name=name;
        this.info=info;
        this.professional=professional;
        this.term=term;
        this.total=total;
        this.kind=kind;
        this.selected=selected;
        this.pId=pId;
    }
}
