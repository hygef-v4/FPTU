package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class User {
    private int userID;          
    private String fullName;    
    private String username;     
    private String password;     
    private int roleID;          
    private String address;      
    private String phone;        
    private String email;        
    private boolean activate;   
}
