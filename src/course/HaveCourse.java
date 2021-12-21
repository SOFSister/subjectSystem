package course;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : course
 * @ClassName : HaveCourse.java
 * @createTime : 2021/12/21 11:58
 * @Email : 874280179@qq.com
 * @Description :
 */
public class HaveCourse {
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

    private int id;
    private String name;
    private String professional;
    private String term;
    private String kind;
    public HaveCourse(int id,String name,String professional,String term,String kind){
        this.id=id;
        this.name=name;
        this.professional=professional;
        this.term=term;
        this.kind=kind;
    }
}
