package models;

/**
 *
 * @author Admin
 */
public class Category {
    String categoryID, categoryName, describe;
    int status;  // Added status field

    public Category() {
    }

    public Category(String categoryID, String categoryName, String describe, int status) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.describe = describe;
        this.status = status;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public int getStatus() {  // Getter for status
        return status;
    }

    public void setStatus(int status) {  // Setter for status
        this.status = status;
    }
}
