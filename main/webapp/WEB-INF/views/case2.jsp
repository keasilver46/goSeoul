<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .flex-container{ 
            width: 100%; 
            height: 100vh; 
            display: -webkit-box; 
            display: -moz-box;
            display: -ms-flexbox; 
            display: flex; 
 
            -webkit-box-align: center; 
            -moz-box-align: center;
            -ms-flex-align: center;
            align-items: center; /* 수직 정렬 */
 
            -webkit-box-pack: center;
            -moz-box-pack: center; 
            -ms-flex-pack: center; 
            justify-content: center; /* 수평 정렬 */
        } 
        
        .findedId{
            background-color: aqua;
        }
 
    </style>
</head>
<body>
    <div class="flex-container"> 
        <div class="findedId">당신의 아이디는 ${bonobono.id }입니다. </div>
    </div>
