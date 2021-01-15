package Models;
// Generated Jan 15, 2021 6:32:47 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * UserType generated by hbm2java
 */
public class UserType  implements java.io.Serializable {


     private Integer typeId;
     private String typeName;
     private Set userses = new HashSet(0);

    public UserType() {
    }

	
    public UserType(String typeName) {
        this.typeName = typeName;
    }
    public UserType(String typeName, Set userses) {
       this.typeName = typeName;
       this.userses = userses;
    }
   
    public Integer getTypeId() {
        return this.typeId;
    }
    
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
    public String getTypeName() {
        return this.typeName;
    }
    
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    public Set getUserses() {
        return this.userses;
    }
    
    public void setUserses(Set userses) {
        this.userses = userses;
    }




}


