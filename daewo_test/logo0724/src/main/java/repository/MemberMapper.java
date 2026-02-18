package repository;

import model.Member;
import org.apache.ibatis.annotations.Mapper;

public interface MemberMapper {
    void insert(Member member);
    Member findByUsername(String username);
}
