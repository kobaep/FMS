package com.foamtec.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
/**
 * Created by apichat on 5/2/2016 AD.
 */
public class ViewService {

    public void addMenuAndName(ModelAndView model, Principal principal) {
        if(principal.getName().equals("user")) {
            model.addObject("name", principal.getName());
            model.addObject("roleName", "user");
        } else {
//            AppUser appUser = appUserService.findByUsername(principal.getName());
//            model.addObject("name", appUser.getName());
//            model.addObject("roleName", appUser.getRoleName());
        }
        model.addObject("logout", "on");
    }

    public void addLogin(ModelAndView model) {
        model.addObject("login", "on");
    }
}
