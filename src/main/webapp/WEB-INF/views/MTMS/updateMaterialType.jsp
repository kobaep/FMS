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
                <input type="text" class="form-control input-lg" id="inputMaterialType" placeholder="Material Type" autocomplete="off" value="${materialType.typeName}" required>
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
        $("#materialTypeFormId").submit(function() {
            var data = {
                inputId : "${materialType.id}",
                inputMaterialType : $("#inputMaterialType").val()
            };
            $.ajax({
                url: '${home}mtms/materialTypePrivate/update',
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

        $("#btnDelete").click(function() {
            $("#alertDeleteModal").modal({show:true});
        });

        $("#btnDeleteConfirm").click(function() {
            var data = {
                inputId : "${materialType.id}"
            };
            console.log(data);
            $.ajax({
                url: '${home}mtms/materialTypePrivate/delete',
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