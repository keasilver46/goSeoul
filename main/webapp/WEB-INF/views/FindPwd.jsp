<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(function(){
        $("#btn").click(function(){
            let id = $("input[name='ui_id']").val();
            let email = $("input[name='ui_email']").val();
            /* let obj = {"name":id, "email":email}; */
            $.ajax({
                url:"find.do",
                dataType:'json',
                type:'post',
                data: {"id": id, "email": email},
                success: function(data) {
                    if (JSON.parse(data) == true) {
                        alert("임시 비밀번호가 발급되었습니다. 메일함을 확인해 주세요.");
                        console.log(data);
                    } else {
                        alert("아이디 또는 이메일을 정확하게 입력해 주세요.");
                        console.log(data);
                    }
                }
            });
        });
    });
        
</script>
</head>
<title>임시 비밀번호 발급</title>
<body>
<form method="post">
	<h2>임시 비밀번호 발급</h2>
	아이디<br>
	<input type="text" name="ui_id"><br>
	이메일<br>
	<input type="email" name="ui_email"><br>
	<input type="button" value="임시비밀번호 발급" id="btn"><br> 
</form>
</body>
</html>