<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:url value="/" var="home" />
<%@page session="true"%>
<div class="container">
    <form class="form-horizontal" id="appUserId" action="" method="GET">
        <div class="form-group">
            <label for="inputUser" class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputUser" placeholder="Username" required="required" value="${appUser.username}" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputPassword" placeholder="Password" required="required" value="${appUser.password}" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputName" placeholder="Name" required="required" value="${appUser.name}" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputDepartment" class="col-sm-2 control-label">Department</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputDepartment" placeholder="Department" required="required" value="${appUser.department}" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputDepartmentCode" class="col-sm-2 control-label">Department Code</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputDepartmentCode" placeholder="Department Code" required="required" value="${appUser.departmentCode}" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
                <input type="email" class="form-control input-lg" id="inputEmail" placeholder="Email" required="required" value="${appUser.emailAddress}" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputTelephoneNumber" class="col-sm-2 control-label">Telephone Number</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputTelephoneNumber" placeholder="Telephone Number" required="required" value="${appUser.phoneNumber}" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <label for="inputRoleName" class="col-sm-2 control-label">Role Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputRoleName" placeholder="Role Name" required="required" value="${appUser.roleName}" autocomplete="off">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary btn-lg">Update</button>
                <button type="button" id="btnDelete" class="btn btn-danger btn-lg col-sm-offset-1">Delete</button>
            </div>
        </div>
    </form>
</div>
<div class="modal fade" id="alertDeleteModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title">Warning</h4>
            </div>
            <div class="modal-body">
                Delete form database.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnDeleteConfirm">Confirm</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#appUserId").submit(function() {
            var data = {
                inputId : "${appUser.id}",
                inputUser : $("#inputUser").val(),
                inputPassword : $("#inputPassword").val(),
                inputName : $("#inputName").val(),
                inputDepartment : $("#inputDepartment").val(),
                inputDepartmentCode : $("#inputDepartmentCode").val(),
                inputEmail : $("#inputEmail").val(),
                inputTelephoneNumber : $("#inputTelephoneNumber").val(),
                inputRoleName : $("#inputRoleName").val()
            };
            $.ajax({
                url: '${home}appuser/update',
                type: "POST",
                headers: {
                    Accept: "application/json"
                },
                data: {
                    data : JSON.stringify(data)
                },
                dataType: "json",
                success: function(data){
                    window.location.href = "${home}appuser?list";
                },
                error: function(data){
                    alert("saved error.");
                }
            });
            return false;
        });

        $("#btnDelete").click(function() {
            $("#alertDeleteModal").modal({show:true});
        });

        $("#btnDeleteConfirm").click(function() {
            var data = {
                inputId : "${appUser.id}"
            };
            console.log(data);
            $.ajax({
                url: '${home}appuser/delete',
                type: "POST",
                headers: {
                    Accept: "application/json"
                },
                data: {
                    data : JSON.stringify(data)
                },
                dataType: "json",
                success: function(data){
                    window.location.href = "${home}appuser?list";
                },
                error: function(data){
                    alert("saved error.");
                }
            });
            return false;
        });
    });
</script>