package repository;

import java.util.List;

import model.ApiUser;

public interface ApiUserMapper {
    void deleteAll();
    void insert(ApiUser user);
    List<ApiUser> findAll();
}
