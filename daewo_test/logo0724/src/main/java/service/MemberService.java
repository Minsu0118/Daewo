package service;

import model.Member;

public interface MemberService {
    void register(Member member);
    Member getByUsername(String username);
}
