<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:url value="/" var="home" />
<%@page session="true"%>
<div class="container">
    <div class="row">
        <div class="col-sm-12 alert alert-dismissible alert-success">
            <div align="center">
                <h4><label>All User</label></h4>
                <div class="table-responsive" style="height: 500px;">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>USER</th>
                            <th>PASSWORD</th>
                            <th>NAME</th>
                            <th>DEPARTMENT</th>
                            <th>EMAIL</th>
                            <th>TELEPHONE</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="appUser" items="${appUsers}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${appUser.username}</td>
                                    <td>${appUser.password}</td>
                                    <td>${appUser.name}</td>
                                    <td>${appUser.department}</td>
                                    <td>${appUser.emailAddress}</td>
                                    <td>${appUser.phoneNumber}</td>
                                    <td><a href="${home}appuser/${appUser.id}?update" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>