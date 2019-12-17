<%--
  Created by IntelliJ IDEA.
  User: why
  Date: 2018/1/29
  Time: 下午 04:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="css/bottom.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="bottoms_allin_div" id="bottoms_allin_div">
    <div class="bottoms_main_div">
        <ul class="bottoms_main_div_ul">
            <li class="bottoms_main_div_ul_imgli"><img src="img/bottom/bottoms1.jpg"/></li>
            <li class="bottoms_main_div_ul_txtli"><span class="bottoms_main_div_ul_spanli">正品保障</span> <br/>正品行货 放心选购 </li>
            <li class="bottoms_main_div_ul_imgli"><img src="img/bottom/bottoms2.jpg"/></li>
            <li class="bottoms_main_div_ul_txtli"><span class="bottoms_main_div_ul_spanli">满99包邮</span><br/>满86元 免运费</li>
            <li class="bottoms_main_div_ul_imgli"><img src="img/bottom/bottoms3.jpg"/></li>
            <li class="bottoms_main_div_ul_txtli"><span class="bottoms_main_div_ul_spanli">售后无忧</span><br/>7天无理由退货</li>
            <li class="bottoms_main_div_ul_imgli"><img src="img/bottom/bottoms4.jpg"/></li>
            <li style="font-size: 14px;color: #b9b9b9;margin-top: 10px;"><span class="bottoms_main_div_ul_spanli">准时送达</span><br/>收货时间由你做主</li>
        </ul>
        <div style="width: 1200px;height: auto;overflow: hidden;border-top: 1px solid #e5e5e5">
            <dl class="bottoms_main_div_dl">
                <dt>新手入门</dt>
                <dd><a href="#">购物流程</a></dd>
                <dd><a href="#">会员制度</a></dd>
                <dd><a href="#">订单查询</a></dd>
                <dd><a href="#">发票制度</a></dd>
            </dl>
            <dl class="bottoms_main_div_dl">
                <dt>支付方式</dt>
                <dd><a href="#">货到付款</a></dd>
                <dd><a href="#">网上支付</a></dd>
                <dd><a href="#">银行转账</a></dd>
                <dd><a href="#">礼品卡支付</a></dd>
                <dd><a href="#">其它支付</a></dd>
            </dl>
            <dl class="bottoms_main_div_dl">
                <dt>配送服务</dt>
                <dd><a href="#">配送进度查询</a></dd>
                <dd><a href="#">商品验货与签收单</a></dd>
            </dl>
            <dl class="bottoms_main_div_dl">
                <dt>售后保障</dt>
                <dd><a href="#">退换货政策</a></dd>
                <dd><a href="#">联系客服</a></dd>
                <dd><a href="#">产品质量保证</a></dd>
            </dl>
            <dl class="bottoms_main_div_dl">
                <dt>联系我们</dt>
                <dd><a href="#">网站故障报告</a></dd>
                <dd><a href="#">购物咨询</a></dd>
                <dd><a href="#">投诉与建议</a></dd>
            </dl>
            <div class="bottoms_main_div_qrCoodeDiv">
                <div class="btqd1">
                    <p class="bottoms_main_div_qrCoodeP1">APP更优惠</p>
                    <img class="bottoms_main_div_qrCoodeI1" src="img/bottom/bottoms5.png"/>
                </div>
                <div class="btqd2">
                    <p class="bottoms_main_div_qrCoodeP2">加微信查订单</p>
                    <img class="bottoms_main_div_qrCoodeI2" src="img/bottom/bottoms6.jpg"/>
                </div>
                <div class="btqd3">
                    <p class="bottoms_main_div_qrCoodeP3">扫一扫有惊喜哦</p>
                    <img class="bottoms_main_div_qrCoodeI3" src="img/top/qr.png"/>
                </div>
            </div>
        </div>
        <div class="bottoms_main_div_endDiv">
            <p>鲁ICP备17625554587号 | 经营证照 | 互联网药品信息服务资格证 | 违法和不良信息举报电话：0514-85899118 | 鲁B2-20170039</p>
            <p>Copyright© 易买网 2017-2018，All Rights Reserved</p>
            <ul>
                <% for(int i=1; i<=6; i++){ %>
                    <li><img src="img/bottom/b_<%out.print(i);%>.gif"></li>
                <%}%>
            </ul>
        </div>
        <br />
    </div>
</div>
</body>
</html>

