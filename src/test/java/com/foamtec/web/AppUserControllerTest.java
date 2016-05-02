package com.foamtec.web;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.notNullValue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.foamtec.dao.AppUserDao;
import org.json.JSONObject;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by apichat on 5/2/2016 AD.
 */
public class AppUserControllerTest extends AbstractTestController {

    @Autowired
    private AppUserDao appUserDao;

    @Test
    public void appUserPageCreateTest() throws Exception {
        this.mockMvc.perform(get("/appuser").principal(principal).param("form", ""))
                .andExpect(status().isOk())
                .andExpect(view().name("APPUSER/create"))
                .andExpect(model().attribute("name", notNullValue()))
                .andExpect(model().attribute("logout", "on"))
                .andExpect(model().attribute("roleName", notNullValue()));
    }

    @Test
    public void appUserPageShowListTest() throws Exception {
        this.mockMvc.perform(get("/appuser").principal(principal).param("list", ""))
                .andExpect(status().isOk())
                .andExpect(view().name("APPUSER/list"))
                .andExpect(model().attribute("name", notNullValue()))
                .andExpect(model().attribute("logout", "on"))
                .andExpect(model().attribute("roleName", notNullValue()))
                .andExpect(model().attribute("appUsers", notNullValue()));
    }

    @Test
    public void appUserPageUpdateTest() throws Exception {

        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("inputUser", "kopeenoL");
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

        this.mockMvc.perform(get("/appuser/" + appUserDao.getByUsername("kopeenoL").getId()).principal(principal).param("update", ""))
                .andExpect(status().isOk())
                .andExpect(view().name("APPUSER/update"))
                .andExpect(model().attribute("name", notNullValue()))
                .andExpect(model().attribute("logout", "on"))
                .andExpect(model().attribute("roleName", notNullValue()))
                .andExpect(model().attribute("appUser", notNullValue()));
    }
}
