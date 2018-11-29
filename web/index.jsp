<%@ page import="FileOperation.FileDelete" %><%--
  Created by IntelliJ IDEA.
  User: Genius Cheng
  Date: 2018/11/16
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="/jquery-2.1.1/jquery.min.js"></script>

    <title>摄像头视频展示</title>
</head>
<body>

   <%--<%while((new RedisOperation()).getFileInfoLength()>0){%>
      <!--引入videoshow.jsp 文件，并传入一批文件开始的参数-->
        <jsp:include page="videoshow.jsp" flush="true">
           <jsp:param name="start" value="<%=(new RedisOperation()).getFileInfo() %>"/>
        </jsp:include>
    <%

    }%>--%>
   <img id="img" src="" style="position:absolute; left:100px; top:100px; " alter="加载中...">
   <button type="button" onclick="mypause()">暂停</button>
   <script>
       setInterval(function(){
       $.ajax({
           //直接"post"或者"get",不需要"doPost","doGet"，该函数到后端接收缓冲区会自动匹配
           type : "post",
           //servlet文件名为/UploadServlet，需要提前在web.xml里面注册
           url : "/AjaxServlet",
           dataType : "text",  //数据类型，可以为json，xml等等.
           success : function(data)
           {
               //Result为后端post函数传递来的数据，这里写结果操作代码
               //document.write(Result);
               $("#img").attr("src","/photos/"+data);
           },
           error : function()
           {
               //获取数据失败，处理代码
           }
       });
       },100);   //0.1秒请求一次


   </script>



<script language="JavaScript">

       function mypause() {
           window.location.href = "pause.jsp";
       }
  </script>




</body>
</html>
