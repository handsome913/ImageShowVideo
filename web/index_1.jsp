<%--
  Created by IntelliJ IDEA.
  User: Genius Cheng
  Date: 2018/9/17
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%--思路：用时间作为图片的名字，第一张图片到达时，记录下图片的名字，
开始显示目录中的图片，如果上传不及时，可以先用有加载符号的图片替代--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>


<html>
  <head>
    <title>摄像头视频展示</title>
  </head>
  <body>
      <%
          String filepath=request.getSession().getServletContext().getRealPath("photos");
          File file;
          file =new File(filepath);
          String fileinfo;
          //Thread.sleep(3000);
          //while(true){
              File[] fileList = file.listFiles();
              if(fileList!=null){
                  for (int i=0;i< fileList.length;i++) {
                      if (fileList[i].isFile()) {
                           fileinfo="/photos/"+fileList[i].getName();
                          Thread.sleep(100);
      %>
                       <img src="<%=fileinfo%>"  style="position:absolute; left:100px; top:100px; " alter="加载中...">
      <%
                      }
                  }
              }
         // }
      %>

  </body>
</html>
