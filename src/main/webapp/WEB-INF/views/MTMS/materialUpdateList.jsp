<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<spring:url value="/" var="home" />
<div class="container">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-6">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Material</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <c:forEach var="material" items="${materialType.matters}">
                            <c:if test="${material.status eq 'CREATE'}">
                                <a href="${home}mtms/materialPrivate/${material.id}?update" class="list-group-item list-group-item-success">
                                    <span class="badge">${fn:length(material.materialCodes)}</span>
                                        ${material.materialName}
                                </a>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>