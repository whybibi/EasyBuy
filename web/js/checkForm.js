

$(function(){
    $("#userName").blur(function () {
        var name = $("#userName").val().trim();
        if(name==null || name=="" || name.length>16){
            $("#nameP").html("*用户名格式不正确，不能为空不能超过16个字符");
            $("#nameP").css("color","red");
            $("#nameP").show("fast");
        }else{
            $.get("/reg","name="+name,callBack);
            function callBack(data) {
                if(data == "true"){
                    $("#nameP").html("*用户名已被使用");
                    $("#nameP").show("fast");
                    return;
                }else{
                    $("#nameP").html("✔用户名可以使用");
                    $("#nameP").css("color","green");
                    $("#nameP").show("fast");
                    return;
                }
            }
            $("#nameP").html("");
            $("#nameP").css("color","red");
            $("#nameP").hide("fast");
        }
    });

    $("#passWord").blur(function () {
        var pwd = $("#passWord").val().trim();
        if(pwd==null || pwd=="" || pwd.length>16){
            $("#pwdP").html("*密码格式不正确，不能为空不能超过12个字符");
            $("#pwdP").show("fast");
        }else{
            $("#pwdP").html("");
            $("#pwdP").hide("fast");
        }
    });

    $("#rePwd").blur(function () {
        var rpwd = $("#rePwd").val().trim();
        if(rpwd==null || rpwd=="" || rpwd!=$("#passWord").val().trim()){
            $("#rpwdP").html("*确认密码与密码不相符");
            $("#rpwdP").show("fast");
        }else{
            $("#rpwdP").html("");
            $("#rpwdP").hide("fast");
        }
    });

    $("#phone").blur(function () {
        var phone = $("#phone").val().trim();
        var phoneReg = /^1[3|4|5|7|8]\d{9}$/;
        if(!phoneReg.test(phone)){
            $("#phoneP").html("*手机号格式不正确");
            $("#phoneP").show("fast");
        }else{
            $("#phoneP").html("");
            $("#phoneP").hide("fast");
        }
    });

    $("#realName").blur(function () {
        var realname = $("#realName").val().trim();
        if(realname==null || realname==""){
            $("#realnameP").html("*真实姓名不能为空");
            $("#realnameP").show("fast");
        }else{
            $("#realnameP").html("");
            $("#realnameP").hide("fast");
        }
    });

    $("#idCard").blur(function () {
        var idcard = $("#idCard").val().trim();
        if(idcard==null || idcard==""){
            $("#idcardP").html("*身份证号不能为空");
            $("#idcardP").show("fast");
        }else{
            $("#idcardP").html("");
            $("#idcardP").hide("fast");
        }
    });

})




function checkLog(){
    var name = $.trim($(".name").val());
    var pwd = $.trim($(".pwd").val());
    if(name==null || name==""){
        alert("用户名不能为空！");
        return false;
    }
    if(pwd==null || pwd==""){
        alert("密码不能为空！");
        return false;
    }
    return true;
}


function checkReg(){
    var name =  $.trim($("#userName").val());
    var pwd =  $.trim($("#passWord").val());
    var rpwd =  $.trim($("#rePwd").val());
    var phone =  $.trim($("#phone").val());
    var realname =  $.trim($("#realName").val());
    var id =  $.trim($("#idCard").val());

    console.log(name.toLowerCase())
    if(name==null || name=="" || name.length>16){
        alert("用户名格式不正确，不能为空不能超过16个字！");
        return false;
    }
    if(pwd==null || pwd=="" || pwd.length>12){
        alert("密码格式不正确，不能为空不能超过12个字符！");
        return false;
    }
    if(rpwd==null || rpwd=="" || pwd!=rpwd){
        alert("确认密码与密码不相符！");
        return false;
    }
    var phoneReg = /^1[3|4|5|7|8]\d{9}$/;
    if(!phoneReg.test(phone)){
        alert("手机号格式不正确！");
        return false;
    }
    if(realname==null || realname==""){
        alert("真实姓名不能为空！");
        return false;
    }
    if(id==null || id==""){
        alert("身份证号码不能为空！");
        return false;
    }
    return true;
}