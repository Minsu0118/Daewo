package service;

import lombok.RequiredArgsConstructor;
import model.Member;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import repository.MemberMapper;

@Service("memberService")
@RequiredArgsConstructor
public class MemberServiceImpl implements UserDetailsService, MemberService {

    private final MemberMapper memberMapper;
    private final BCryptPasswordEncoder passwordEncoder;

    @Override
    public void register(Member member) {
        String rawPassword = member.getPassword();
        System.out.println("비밀번호: " + rawPassword);

        if (!rawPassword.startsWith("$2a$")) {
            String encodedPassword = passwordEncoder.encode(rawPassword);
            member.setPassword(encodedPassword);
            System.out.println("비밀번호 암호화: " + encodedPassword);
        } else {
            System.out.println("이미 암호화되어 있습니다!");
        }

        memberMapper.insert(member);
    }

    @Override
    public Member getByUsername(String username) {
        return memberMapper.findByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("로그인 시도 ID: " + username);
        Member member = memberMapper.findByUsername(username);
        System.out.println("조회 member: " + member);

        if (member == null) {
            throw new UsernameNotFoundException("해당 사용자는 없습니다: " + username);
        }

        boolean match = passwordEncoder.matches("my", member.getPassword());
        System.out.println("비밀번호 'my'와 일치 여부: " + match);

        return User.builder()
                .username(member.getUsername())
                .password(member.getPassword())
                .roles("USER")
                .build();
    }
}
