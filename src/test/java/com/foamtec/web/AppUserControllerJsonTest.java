package com.foamtec.web;

import com.foamtec.dao.AppUserDao;
import org.hamcrest.Matchers;
import org.json.JSONObject;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.hamcrest.Matchers.*;
/**
 * Created by apichat on 5/2/2016 AD.
 */
public class AppUserControllerJsonTest extends AbstractTestController {

    @Autowired
    private AppUserDao appUserDao;

    @Test
    public void appUserCreate() throws Exception {

        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("inputUser", "kopeeno");
        jsonObject1.put("inputPassword", "password");
        jsonObject1.put("inputName", "Apichat Eakwongsa");
        jsonObject1.put("inputDepartment", "qa");
        jsonObject1.put("inputDepartmentCode", "qa001");
        jsonObject1.put("inputEmail", "apichat.kop@gmail.com");
        jsonObject1.put("inputTelephoneNumber", "0800103329");
        jsonObject1.put("inputRoleName", "qa");

        this.mockMvc.perform(post("/appuser/create").principal(principal).param("data", jsonObject1.toString()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.process", containsString("success")));

        JSONObject jsonObject2 = new JSONObject();
        jsonObject2.put("inputUser", "kopeeno");
        jsonObject2.put("inputPassword", "password");
        jsonObject2.put("inputName", "Apichat Eakwongsa");
        jsonObject2.put("inputDepartment", "qa");
        jsonObject2.put("inputDepartmentCode", "qa001");
        jsonObject2.put("inputEmail", "apichat.kop@gmail.com");
        jsonObject2.put("inputTelephoneNumber", "0800103329");
        jsonObject2.put("inputRoleName", "qa");

        this.mockMvc.perform(post("/appuser/create").principal(principal).param("data", jsonObject2.toString()))
                .andExpect(status().isInternalServerError())
                .andExpect(jsonPath("$.process", containsString("fail")));
    }

    @Test
    public void appUserUpdateTest() throws Exception {

        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("inputUser", "testtt");
        jsonObject1.put("inputPassword", "password");
        jsonObject1.put("inputName", "Apichat Eakwongsa");
        jsonObject1.put("inputDepartment", "qa");
        jsonObject1.put("inputDepartmentCode", "qa001");
        jsonObject1.put("inputEmail", "apichat.kop@gmail.com");
        jsonObject1.put("inputTelephoneNumber", "0800103329");
        jsonObject1.put("inputRoleName", "qa");

        this.mockMvc.perform(post("/appuser/create").principal(principal).param("data", jsonObject1.toString()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.process", containsString("success")));

        JSONObject jsonObject2 = new JSONObject();
        jsonObject2.put("inputId", appUserDao.getByUsername("testtt").getId());
        jsonObject2.put("inputUser", "haha");
        jsonObject2.put("inputPassword", "password");
        jsonObject2.put("inputName", "Apichat Eakwongsa");
        jsonObject2.put("inputDepartment", "qa");
        jsonObject2.put("inputDepartmentCode", "qa001");
        jsonObject2.put("inputEmail", "apichat.kop@gmail.com");
        jsonObject2.put("inputTelephoneNumber", "0800103329");
        jsonObject2.put("inputRoleName", "qa");

        this.mockMvc.perform(post("/appuser/update").principal(principal).param("data", jsonObject2.toString()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.process", containsString("success")));
    }

    @Test
    public void appUserDeleteTest() throws Exception {

        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("inputUser", "kopeeno2");
        jsonObject1.put("inputPassword", "password");
        jsonObject1.put("inputName", "Apichat Eakwongsa");
        jsonObject1.put("inputDepartment", "qa");
        jsonObject1.put("inputDepartmentCode", "qa001");
        jsonObject1.put("inputEmail", "apichat.kop@gmail.com");
        jsonObject1.put("inputTelephoneNumber", "0800103329");
        jsonObject1.put("inputRoleName", "qa");

        this.mockMvc.perform(post("/appuser/create").principal(principal).param("data", jsonObject1.toString()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.process", containsString("success")));

        JSONObject jsonObject2 = new JSONObject();
        jsonObject2.put("inputId", appUserDao.getByUsername("kopeeno2").getId());
        this.mockMvc.perform(post("/appuser/delete").principal(principal).param("data", jsonObject2.toString()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.process", containsString("success")));
    }
}
