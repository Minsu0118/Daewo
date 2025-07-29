package service;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import model.ApiUser;
import repository.ApiUserMapper;

@Service
@RequiredArgsConstructor
public class ApiUserServiceImpl implements ApiUserService {

    private final ApiUserMapper apiUserMapper;
    private final RestTemplate restTemplate = new RestTemplate();

    private static final String API_URL = "https://jsonplaceholder.typicode.com/users";

    @Override
    public List<ApiUser> findAllUsers() {
        return apiUserMapper.findAll();
    }
    
    @Scheduled(fixedDelay = 50000)
    @Override
    public void fetchAndSaveUsers() {
        System.out.println("스케줄러"); 

        ResponseEntity<ApiUser[]> response = restTemplate.getForEntity(API_URL, ApiUser[].class);

        if (response.getBody() != null) {
            List<ApiUser> users = Arrays.asList(response.getBody());

            apiUserMapper.deleteAll();
            for (ApiUser user : users) {
                apiUserMapper.insert(user);
            }
        }
    }
}
