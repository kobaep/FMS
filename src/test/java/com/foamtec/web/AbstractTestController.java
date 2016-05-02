package com.foamtec.web;

import java.security.Principal;

import com.foamtec.FmsApplication;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
/**
 * Created by apichat on 5/2/2016 AD.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = FmsApplication.class)
@WebAppConfiguration
public class AbstractTestController {

    private final Logger LOGGER = LoggerFactory.getLogger(AbstractTestController.class);

    @Autowired
    protected WebApplicationContext wac;

    protected MockMvc mockMvc;

    protected Principal principal;

    @Before
    public void setup() throws Exception {

        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();

        principal = new Principal() {
            @Override
            public String getName() {
                return "user";
            }

        };

        LOGGER.debug("-= test case stat =-");
    }

    @After
    public void after() {
        LOGGER.debug("-= test case stop =-");
    }
}

