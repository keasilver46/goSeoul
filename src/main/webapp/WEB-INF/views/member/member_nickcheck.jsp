<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.example.goSeoul.dao.*"%>
<%
 request.setCharacterEncoding("utf-8");

 String nick=request.getParameter("memnick");
 System.out.println("nick="+nick);

 MemberDaoImpl md = new MemberDaoImpl();

 int re = md.checkMemberNick(nick);
 // 1이면 중복 -1이면 사용가능 닉네임

 out.println(re);
%>
