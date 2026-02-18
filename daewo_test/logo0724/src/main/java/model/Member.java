package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString(exclude = "password")
public class Member {
    private int id; //아이디
    private String username; //유저id
    private String password; //비밀번호
    private String email; //이메일
    private String name; // 이름
}
