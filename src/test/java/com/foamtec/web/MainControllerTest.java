package com.foamtec.web;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.hamcrest.Matchers.notNullValue;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
/**
 * Created by apichat on 5/2/2016 AD.
 */
public class MainControllerTest extends AbstractTestController {

    @Test
    public void homeNonLoginTest() throws Exception {
        this.mockMvc.perform(get("/")).andExpect(status().isOk())
                .andExpect(view().name("home"))
                .andExpect(model().attribute("login", "on"));
    }
}
