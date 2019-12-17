<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%!
	public String alertMessage(String value){
		return "<script type='text/javascript'>"+"alert('"+value+"');"+"</script>";
	}
	public String alertMessageAndJump(String value,String target){
		return "<script type='text/javascript'>"+"alert('"+value+"'); window.location.href='"+target+"'"+"</script>";
	}
%>