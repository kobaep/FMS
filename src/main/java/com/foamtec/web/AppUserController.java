package com.foamtec.web;

import java.security.Principal;

import com.foamtec.service.AppUserService;
import com.foamtec.service.ViewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by apichat on 5/2/2016 AD.
 */
@Controller
public class AppUserController {

    @Autowired
    private AppUserService appUserService;

    @Autowired
    private ViewService viewService;

    @RequestMapping(value = "/appuser", params = "form", method = RequestMethod.GET)
    public ModelAndView appUserPageCreate(ModelAndView model, Principal principal) {
        viewService.addMenuAndName(model, principal);
        model.setViewName("APPUSER/create");
        return model;
    }

    @RequestMapping(value = "/appuser", params = "list", method = RequestMethod.GET)
    public ModelAndView appUserPageShowList(ModelAndView model, Principal principal) {
        viewService.addMenuAndName(model, principal);
        model.addObject("appUsers", appUserService.findAll());
        model.setViewName("APPUSER/list");
        return model;
    }

    @RequestMapping(value = "/appuser/{id}", params = "update", method = RequestMethod.GET)
    public ModelAndView appUserPageUpdate(@PathVariable("id") Long id, ModelAndView model, Principal principal) {
        viewService.addMenuAndName(model, principal);
        model.addObject("appUser", appUserService.findById(id));
        model.setViewName("APPUSER/update");
        return model;
    }
}
