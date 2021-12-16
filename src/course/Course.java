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

    public int getAll() {
        return all;
    }

    public void setAll(int all) {
        this.all = all;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
    private int all;
    private String type;
    private int selected;
    private int pId;
    public Course(int id,String name,String info,String professional,String term,int all,String type,int selected,int pId){
        this.id=id;
        this.name=name;
        this.info=info;
        this.professional=professional;
        this.term=term;
        this.all=all;
        this.type=type;
        this.selected=selected;
        this.pId=pId;
    }
}
