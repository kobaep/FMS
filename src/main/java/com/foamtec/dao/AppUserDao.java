package com.foamtec.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.foamtec.entity.AppUser;

import java.util.List;

/**
 * Created by apichat on 5/2/2016 AD.
 */
@Repository
@Transactional
public class AppUserDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void create(AppUser appUser) {
        entityManager.persist(appUser);
    }

    public void delete(AppUser appUser) {
        if (entityManager.contains(appUser)) {
            entityManager.remove(appUser);
        } else {
            entityManager.remove(entityManager.merge(appUser));
        }
    }

    public List<AppUser> getAll() {
        Criteria c = ((Session) entityManager.getDelegate()).createCriteria(AppUser.class);
        return c.list();
    }

    public AppUser getById(long id) {
        return entityManager.find(AppUser.class, id);
    }

    public AppUser getByUsername(String username) {
        Criteria c = ((Session) entityManager.getDelegate()).createCriteria(AppUser.class);
        c.add(Restrictions.eq("username", username));
        return (AppUser)c.uniqueResult();
    }

    public void update(AppUser appUser) {
        entityManager.merge(appUser);
    }
}
