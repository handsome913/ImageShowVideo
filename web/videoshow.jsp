<%@ page import="redis.RedisOperation" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: Genius Cheng
  Date: 2018/9/17
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%--思路：用时间作为图片的名字，第一张图片到达时，记录下图片的名字，
开始显示目录中的图片，如果上传不及时，可以先用有加载符号的图片替代--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-hant">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>demo</title>
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="full-screen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <style>
        *{padding:0; margin:0;}
        html,body{position:relative; height:100%;}
        #section{position:relative; max-width:640px; margin:30px auto; height:100%; overflow:hidden;}
        #section .vin{width:100%; height:100%; background-repeat: no-repeat;}
        #section #loading{position:absolute; left:50%; top:50%; width:50px; height:50px; background:#000; -webkit-transform:translate(-50%,-50%); transform:translate(-50%,-50%);}
    </style>
    <script src="startImgVideo.js"></script>
</head>
<body>
<h1></h1>
<div id="section"></div>



<script language="JavaScript">
    /*播放完毕之后仍然跳回本页*/
    var JUMPURL = "/videoshow.jsp";

    /*20秒图片还没加载完就跳转*/
    window.jumpUrl = setTimeout(function(){
        location.href = JUMPURL;
    }, 20000);

    //先准备好图片路径
    var imageUrls = [];
    var filename;
   <%--for(var i=<%=(new RedisOperation()).getFileInfoLength()%>;i<=30+<%=(new RedisOperation()).getFileInfoLength()%>;i++){--%>
    <%
        for(int i = 1; i <=30;i++){
    %>


        //imageUrls.push('/photos/pic' + ( (new Array(2).join('0') + i).slice(-2) ) +'.jpg');
        imageUrls.push('/photos/' + '<%=(new RedisOperation()).getFileInfo()%>');


    <% }%>
    //容器
    var sec = document.getElementById('section');

    startImgVedio({
        imgs:imageUrls,
        target:sec,
        className:'vin',//要加的类名
        timeLenth:'10', //多少秒播放完毕
        //所有图片都准备好了。
        imgsOnloadCallback:function(){
            //这里删除掉一开始的20秒的定时器 window.jumpUrl
            clearTimeout(window.jumpUrl);
        },
        //播放完毕
        playCallback:function(){
            <%--(new RedisOperation()).getFileInfo();--%>
           /*
            //播放完将这一批图片删除。
            var fso = new ActiveXObject("Scripting.FileSystemObject");
            var f1;
            for(var i=1;i<=30;i++) {
               f1=fso.GetFile('/photos/'+imageUrls[i]);
               f1.delete();
            }*/
            //播放完毕跳转
            window.location.href = JUMPURL;
        }
    });
</script>
</body>
</html>