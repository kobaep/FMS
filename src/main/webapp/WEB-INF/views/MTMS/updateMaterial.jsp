<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page session="true"%>
<spring:url value="/" var="home" />
<div class="container">
    <form class="form-horizontal" id="materialFormId" action="" method="POST">
        <div class="form-group">
            <label class="col-sm-2 control-label">Material Type</label>
            <div class="col-sm-10">
                <c:set var="materialType" value="${material.materialType}"/>
                <p class="form-control-static">${materialType.typeName}</p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputMaterialName" class="col-sm-2 control-label">Material Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputMaterialName" placeholder="Material Name" value="${material.materialName}" autocomplete="off" required>
            </div>
        </div>
        <div class="form-group">
            <label for="inputUlNumber" class="col-sm-2 control-label">UL Number</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputUlNumber" placeholder="UL Number" value="${material.ulNumber}" autocomplete="off" required>
            </div>
        </div>
        <div class="form-group">
            <label for="inputManufacturing" class="col-sm-2 control-label">Manufacturing</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputManufacturing" placeholder="Manufacturing Locations" value="${material.manufacturing}" autocomplete="off" required>
            </div>
        </div>
        <div class="form-group form-inline">
            <label for="inputManufacturing" class="col-sm-2 control-label">Current File</label>
            <div class="col-sm-10">
                <p class="form-control-static">
                    <c:if test="${not empty material.specUrl}">
                        <a class="btn btn-info" href="${home}resources/filePDF${material.specUrl}" target="_blank" role="button">SPEC <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span></a>
                    </c:if>
                    <c:if test="${not empty material.msdsUrl}">
                        <a class="btn btn-info" href="${home}resources/filePDF${material.msdsUrl}" target="_blank" role="button">MSDS <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span></a>
                    </c:if>
                    <c:if test="${not empty material.rohsUrl}">
                        <a class="btn btn-info" href="${home}resources/filePDF${material.rohsUrl}" target="_blank" role="button">RoHS <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span></a>
                    </c:if>
                    <c:if test="${not empty material.halogenUrl}">
                        <a class="btn btn-info" href="${home}resources/filePDF${material.halogenUrl}" target="_blank" role="button">Halogen Free <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span></a>
                    </c:if>
                </p>
            </div>
        </div>

        <div class="form-group">
            <label for="inputSpec" class="col-sm-2 control-label"><font color="red">Spec</font></label>
            <div class="col-sm-10 form-inline">
                <span class="btn btn-file"><input type="file" id="inputSpec"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputRoHs" class="col-sm-2 control-label"><font color="red">RoHs</font></label>
            <div class="col-sm-10 form-inline">
                <span class="btn btn-file"><input type="file" id="inputRoHs"></span>
                <input type="text" class="form-control input-lg" id="inputDateRoHs" placeholder="Start Test Date" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputMSDS" class="col-sm-2 control-label"><font color="red">MSDS</font></label>
            <div class="col-sm-10 form-inline">
                <span class="btn btn-file"><input type="file" id="inputMSDS"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputHalogen" class="col-sm-2 control-label"><font color="red">Halogen Free</font></label>
            <div class="col-sm-10 form-inline">
                <span class="btn btn-file"><input type="file" id="inputHalogen"></span>
                <input type="text" class="form-control input-lg" id="inputDateHF" placeholder="Start Test Date" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" id="btnUpdate" class="btn btn-primary btn-lg">Update</button>
                <c:if test="${material.status eq 'CREATE' or material.status eq 'REJECT'}">
                    <button type="button" id="btnCancle" class="btn btn-danger btn-lg col-sm-offset-1">Remove</button>
                </c:if>
            </div>
        </div>
    </form>
    <c:set var="materialType" value="${material.materialType}"/>
</div>
<script>
    $(document).ready(function() {
        $("#inputDateRoHs").datepicker({ dateFormat: "dd/mm/yy" });

        $("#inputDateHF").datepicker({ dateFormat: "dd/mm/yy" });

        $("#materialFormId").submit(function() {
            var formData = new FormData();
            formData.append("inputSpec", $("#inputSpec")[0].files[0]);

            formData.append("inputRoHs", $('#inputRoHs')[0].files[0]);
            formData.append("inputDateRoHs", $("#inputDateRoHs").val());
            if($('#inputRoHs')[0].files[0] != null) {
                if(!$("#inputDateRoHs").val() ) {
                    $("#inputDateRoHs").focus();
                    return false;
                }
            }
            formData.append("inputMSDS", $('#inputMSDS')[0].files[0]);

            formData.append("inputHalogen", $('#inputHalogen')[0].files[0]);
            formData.append("inputDateHF", $("#inputDateHF").val());
            if($('#inputHalogen')[0].files[0] != null) {
                if(!$("#inputDateHF").val()) {
                    $("#inputDateHF").focus();
                    return false;
                }
            }
            formData.append("inputManufacturing", $("#inputManufacturing").val());
            formData.append("inputMaterialName", $("#inputMaterialName").val());
            formData.append("inputUlNumber", $("#inputUlNumber").val());
            formData.append("id", ${material.id});

            $.ajax({
                type: "POST",
                headers: {
                    Accept: "application/json",
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "${home}mtms/materialPrivate/update",
                processData: false,
                contentType: false,
                data: formData,
                async: false,
                success: function(data){
                    window.location.href = "${home}mtms/material/${materialType.id}?list";
                },
                error: function(data){
                    alert("saved error.");
                    return false;
                }
            });
            return false;
        });

        $("#btnCancle").click(function() {
            var data = {
                inputId : "${material.id}"
            };
            $.ajax({
                url: "${home}mtms/materialPrivate/remove",
                type: "POST",
                headers: {
                    Accept: "application/json"
                },
                data: {
                    data : JSON.stringify(data)
                },
                dataType: "json",
                success: function(data){
                    window.location.href = "${home}mtms/material/${materialType.id}?list";
                },
                error: function(data){
                    alert("saved error.");
                    return false;
                }
            });
            return false;
        });
    });
</script>