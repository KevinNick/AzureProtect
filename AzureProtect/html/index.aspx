﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AzureProtectPage.aspx.cs" Inherits="AzureProtect.AzureProtectPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>雲端資料</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Alegreya+Sans:100,300,400,500,700,800,900,100italic,300italic,400italic,500italic,700italic,800italic,900italic' rel='stylesheet' type='text/css'>
</head>

<body>

    <nav>
        <!-- 登入後 -->

        <div class="login_area" style="display:none;">
            <div class="btn_log"><a href="javascript:;">LOGOUT</a>
            </div>
            <div class="name">Chun-Yu Shih</div>
            <div class="profile"><img src="images/profile.jpg" width="40" height="40" />
            </div>
        </div>

        <!-- 登入前 -->

        <div class="login_area">
            <div class="btn_log"><a href="javascript:;">LOGIN</a>
            </div>

            <input name="" type="text" style="margin-right:0px;" />
            <div class="name">PASSWORD</div>
            <input name="" type="text" />
            <div class="name">ACCOUNT</div>


        </div>


    </nav>

    <div class="wrap">
        <div class="left">
            <div class="route">
                <h2 style="margin-left:25px;">FROM</h2>
                <input name="" type="text" />
                <h2>TO</h2>
                <input name="" type="text" style="margin-right:0px;" />
                <div class="btn_log btn_route"><a href="javascript:;">ROUTE</a>
                </div>
            </div>
            <div class="map">
                <div id="map_canvas_custom_238233" style="width:650px; height:440px"></div>
                <script type="text/javascript">
                (function(d, t) {
                    var g = d.createElement(t),
                        s = d.getElementsByTagName(t)[0];
                    g.src = "http://map-generator.net/en/maps/238233.js?point=Taiwan";
                    s.parentNode.insertBefore(g, s);
                }(document, "script"));
                </script>

            </div>
        </div>
        <div class="right">
            <div class="submenu">
                <ul>
                    <li style="margin-left:18px;"><a href="jindex.html">雲端資訊</a>
                    </li>
                    <li><a href="group.html">我的群組</a>
                    </li>
                    <li><a href="javascript:;">即時資訊</a>
                        <ul>
                            <li><a href="weather.html">天氣特報</a></li>
                            <li><a href="alert.html">天災警告</a></li>
                            <li><a href="chat.html">聊天室</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="cloud">
                <ul>
                    <li><a href="javascript:;">雲端資訊</a>

                        <ul>
                            <li>
                                <a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                        </ul>

                    </li>
                    <li><a href="javascript:;">雲端資訊</a>

                        <ul>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                            <li><a href="javascript:;">雲端資訊</a>
                            </li>
                        </ul>

                    </li>

                </ul>
            </div>

            <div class="member" style="display:none;">

                <div class="member_title"><a href="javascript:;">我的群組</a>
                </div>
                <div class="member_item_wrap">


                    <div class="member_item">

                        <a href="javascript:;">
                            <div class="check"></div><img src="images/profile.jpg" width="58" height="58" />
                        </a>

                    </div>
                    <div class="member_item">

                        <a href="javascript:;">
                            <div class="check"></div><img src="images/profile.jpg" width="58" height="58" />
                        </a>

                    </div>
                    <div class="member_item">

                        <a href="javascript:;">
                            <div class="check"></div><img src="images/profile.jpg" width="58" height="58" />
                        </a>

                    </div>
                    <div class="member_item">

                        <a href="javascript:;">
                            <div class="check"></div><img src="images/profile.jpg" width="58" height="58" />
                        </a>

                    </div>
                    <div class="member_item">

                        <a href="javascript:;">
                            <div class="check"></div><img src="images/profile.jpg" width="58" height="58" />
                        </a>

                    </div>
                    <div class="member_item">

                        <a href="javascript:;">
                            <div class="check"></div><img src="images/profile.jpg" width="58" height="58" />
                        </a>

                    </div>
                    <div class="clear"></div>

                    <div class="member_title"><a href="javascript:;">我的群組</a>
                    </div>

                </div>

            </div>
        </div>
    </div>

</body>

</html>
