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

   <%  String filename = application.getAttribute("FileName").toString();
       String filepath="/photos/"+filename;
   %>
   <img src="<%=filepath%>"  style="position:absolute; left:100px; top:100px; " alter="加载中...">

   <h1><%=filename%></h1>
  <script language="JavaScript">
       function myrefresh()
       { <%--
         (new FileDelete()).DeleteFile(filename);
          --%>
           window.location.reload();
       }
       setTimeout('myrefresh()',100); //指定0.1秒刷新一次


  </script>




</body>
</html>
