package service;

import java.util.List;
import model.ApiUser;

public interface ApiUserService {
    void fetchAndSaveUsers();
    List<ApiUser> findAllUsers();
}

