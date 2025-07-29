package controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import model.Member;
import service.MemberService;

@Controller
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;
    private final org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder passwordEncoder;

    @GetMapping({"/", "/main"})
    public String main(Model model, Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            Member member = memberService.getByUsername(username);
            model.addAttribute("username", member.getName());
        }
        return "main";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("member", new Member());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute Member member, Model model) {
        String encrypted = passwordEncoder.encode(member.getPassword());
        member.setPassword(encrypted);
        memberService.register(member);
        return "redirect:/login";
    }

    @GetMapping("/member/{username}")
    @ResponseBody
    public Member getMember(@PathVariable String username) {
        return memberService.getByUsername(username);
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }
}
