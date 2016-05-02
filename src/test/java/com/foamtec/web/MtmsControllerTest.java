package com.foamtec.web;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.notNullValue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import org.json.JSONObject;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * Created by apichat on 5/2/2016 AD.
 */
public class MtmsControllerTest extends AbstractTestController {

    @Test
    public void homeMtmsNonTest() throws Exception {
        this.mockMvc.perform(get("/mtms")).andExpect(status().isOk())
                .andExpect(view().name("MTMS/home"))
                .andExpect(model().attribute("login", "on"));
    }
}
