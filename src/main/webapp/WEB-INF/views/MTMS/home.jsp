<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page session="true"%>
<spring:url value="/" var="home" />
<div class="container">
	<div class="row">
		<div class="col-sm-7">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Material Type</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <c:forEach var="materialType" items="${materialTypes}">
                            <a href="${home}mtms/material/${materialType.id}?list" class="list-group-item list-group-item-success">
                                <span class="badge">${fn:length(materialType.matters)}</span>
                                ${materialType.typeName}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-5">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Option Menu</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <c:if test="${not empty name and roleName eq 'admin'}" >
                            <a href="${home}mtms/materialTypePrivate?form" class="list-group-item list-group-item-info">
                                Create Material Type
                            </a>
                            <a href="${home}mtms/materialTypePrivate/update?list" class="list-group-item list-group-item-info">
                                Update Material Type
                            </a>
                        </c:if>
                        <a href="${home}mtms/material?waitApproveList" class="list-group-item list-group-item-info">
                            <span class="badge">${fn:length(materials)}</span>
                            Waiting Approve
                        </a>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>