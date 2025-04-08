
package model;

/**
 *
 * @author hungs
 */
public class Subjects {

    public int SubjectID;
    public String SubjectName;

    public Subjects() {
    }

    public Subjects(int SubjectID, String SubjectName) {
        this.SubjectID = SubjectID;
        this.SubjectName = SubjectName;
    }

    public int getSubjectID() {
        return SubjectID;
    }

    public void setSubjectID(int SubjectID) {
        this.SubjectID = SubjectID;
    }

    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String SubjectName) {
        this.SubjectName = SubjectName;
    }

}
