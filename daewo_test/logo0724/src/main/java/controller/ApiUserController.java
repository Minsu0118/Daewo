package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import model.ApiUser;
import service.ApiUserService;

@Controller
@RequiredArgsConstructor
public class ApiUserController {

    private final ApiUserService apiUserService;

    @GetMapping("/api/users")
    @ResponseBody
    public List<ApiUser> getAllUsers() {
        return apiUserService.findAllUsers();
    }
    
    @GetMapping("/users")
    public String usersPage() {
        return "users";
    }
}


