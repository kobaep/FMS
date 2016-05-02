<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page session="true"%>
<spring:url value="/" var="home" />
<div class="container">
    <form class="form-horizontal" id="materialTypeFormId" action="" method="POST">
        <div class="form-group">
            <label for="inputMaterialType" class="col-sm-2 control-label">Material Type</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputMaterialType" placeholder="Material Type" autocomplete="off" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default btn-lg">Submit</button>
            </div>
        </div>
    </form>
</div>
<script>
    $(document).ready(function() {
        $("#materialTypeFormId").submit(function() {
            var data = {
                inputMaterialType : $("#inputMaterialType").val()
            };
            $.ajax({
                url: '${home}mtms/materialTypePrivate/create',
                type: "POST",
                headers: {
                    Accept: "application/json"
                },
                data: {
                    data : JSON.stringify(data)
                },
                dataType: "json",
                success: function(data){
                    window.location.href = "${home}mtms";
                },
                error: function(data){
                    alert("saved error.");
                }
            });
            return false;
        });
    });
</script>