package com.foamtec.web;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.foamtec.service.ViewService;

/**
 * Created by apichat on 5/2/2016 AD.
 */
@Controller
public class MtmsController {

    @Autowired
    private ViewService viewService;

    @RequestMapping(value = "/mtms", method = RequestMethod.GET)
    public ModelAndView homeMtms(ModelAndView model, Principal principal) {
        try {
            principal.getName();
            viewService.addMenuAndName(model, principal);
        } catch (Exception e) {
            viewService.addLogin(model);
        }
        model.setViewName("MTMS/home");
        return model;
    }

}
