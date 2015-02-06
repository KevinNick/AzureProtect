<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AzureProtectPage.aspx.cs" Inherits="AzureProtect.AzureProtectPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <style type="text/css">
        .auto-style1 {
            width: 762px;
        }
        .auto-style2 {
            width: 558px;
            height: 300px;
        }
    </style>
</head>

    <head id="Head1" runat="server">
    <style type="text/css">
        html
        {
            background-color:white;
        }
        .tabs
        {
            position:relative;
            top:1px;
            left:10px;
        }
        .tab
        {
            border:solid 1px black;
            background-color:#eeeeee;
            padding:2px 10px;
        }
        .selectedTab
        {
            background-color:white;
            border-bottom:solid 1px white;
        }
        .tabContents
        {
            border:solid 1px black;
            padding:10px;
            background-color:white;
        }
        .auto-style3 {
            height: 195px;
        }
    </style>
    <title>MultiView Tabs</title>
        <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
        <script type="text/javascript">
            $(function () {
                $("#AddGroup").click(function () {
                    $.ajax({
                        url: "http://propeople.cloudapp.net/Service1.svc/Login//Info",
                        data: "{}",
                        contentType: "application/json",
                        success: function (data){
                            var obj = JSON.parse(data.d);
                            //alert(obj.lat);
                            var mapOptions = {
                                center: new google.maps.LatLng(obj.lat,obj.lng),
                                zoom: 8,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                                //  marker:true
                            };
                            var infoWindow = new google.maps.InfoWindow();
                            var map = new google.maps.Map(document.getElementById("dvCanvas"), mapOptions);
                            var trafficLayer = new google.maps.TrafficLayer();
                            trafficLayer.setMap(map);
                            var myLatlng = new google.maps.LatLng(obj.lat,obj.lng);
                            var marker = new google.maps.Marker({
                                position: myLatlng,
                                map: map,
                                title: obj.title,
                                icon:"/Icon/WeatherIcon1.png",
                                //animation: google.maps.Animation.BOUNCE
                            });
                            (function (marker, obj) {
                                google.maps.event.addListener(marker, "click", function (e) {
                                    infoWindow.setContent(obj.description);
                        
                                    //map.center =  new google.maps.LatLng(markers[0].lat,markers[0].lng),
                                    infoWindow.open(map, marker);
                                });
                            })(marker, obj);

                        },
                        type: "post",
                        dataType : "json"
                    });
                });
            });
        </script>
        <script type="text/javascript">
            function pmValidateGLAccount() {
                $.ajax({
                    url: "AzureProtectPage.aspx/Info",
                    data: "{}",
                    contentType: "application/json",
                    success: function (response) {alert(response.d); }
                });
            }; 
        </script>
        <script>
            function GetGoogleMap(jsonData){
                var obj = JSON.parse(jsonData);
                if(obj.length !=0)
                {
                    var mapOptions = {
                        center: new google.maps.LatLng(obj[0].lat,obj[0].lng),
                        zoom: 8,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                        //  marker:true
                    };
                    var infoWindow = new google.maps.InfoWindow();
                    var map = new google.maps.Map(document.getElementById("dvCanvas"), mapOptions);
                    var trafficLayer = new google.maps.TrafficLayer();
                    trafficLayer.setMap(map);
                    for (i = 0; i < obj.length; i++) {
                        var DataItem = obj[i];
                        var myLatlng = new google.maps.LatLng(DataItem.lat,DataItem.lng);
                        var marker = new google.maps.Marker({
                            position: myLatlng,
                            map: map,
                            title: DataItem.title,
                            icon:DataItem.icon,
                            //animation: google.maps.Animation.BOUNCE
                        });
                        (function (marker, DataItem) {
                            google.maps.event.addListener(marker, "click", function (e) {
                                infoWindow.setContent(DataItem.description);
                        
                                //map.center =  new google.maps.LatLng(markers[0].lat,markers[0].lng),
                                infoWindow.open(map, marker);
                            });
                        })(marker, DataItem);
                    }
                }
            }
        </script>

        <script>
            function GetGoogledirections(jsonData){
                var obj = JSON.parse(jsonData);
                if(obj!=null)
                {
                    var mapOptions = {
                        center: new google.maps.LatLng(23.744329, 120.971664),
                        zoom: 8,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                        //  marker:true
                    };
                    var infoWindow = new google.maps.InfoWindow();
                    var map = new google.maps.Map(document.getElementById("dvCanvas"), mapOptions);
                    var trafficLayer = new google.maps.TrafficLayer();
                    trafficLayer.setMap(map);
                    var oldDirections = [];
                    var currentDirections = null;
                    var directionsDisplay;
                    var directionsService = new google.maps.DirectionsService();//路線資訊回傳
                    directionsDisplay = new google.maps.DirectionsRenderer({
                        polylineOptions: {
                            strokeColor: "black"
                        }});
                    directionsDisplay.setMap(map);

                    var request = {
                        origin : obj.from,
                        //中間點
                        //waypoints : [ {
                        //    location : point1,
                        //    stopover : true
                        //}, {
                        //    location : point2,
                        //    stopover : true
                        //} ],
                        destination : obj.to,
                        travelMode : google.maps.DirectionsTravelMode.DRIVING
                    };
 
                    directionsDisplay.setPanel(document.getElementById("Panel5"));
                	 
                    google.maps.event.addListener(directionsDisplay, 'directions_changed',
                      function() {
                          //AlartMessage();
                          //if (currentDirections) {
                          //    oldDirections.push(currentDirections);        
                          //}

                          //currentDirections = directionsDisplay.getDirections();
                      });

                    directionsService.route(request, function(response, status) {
                        if (status == google.maps.DirectionsStatus.OK) {
                            directionsDisplay.setDirections(response);
                            //showSteps(response);
                            var myRoute = response.routes[0].legs[0];
                        
                            for (var i = 0; i < myRoute.steps.length; i++) {
                                var RouteData = myRoute.steps[i];
                                var marker = new google.maps.Marker({
                                    position: RouteData.start_location,
                                    map: map
                                });
                                (function (marker, RouteData) {
                                    google.maps.event.addListener(marker, "click", function (e) {
                                        infoWindow.setContent(RouteData.instructions);
                                        //SearchLocation(RouteData.start_location);
                                        //map.center =  new google.maps.LatLng(markers[0].lat,markers[0].lng),
                                        infoWindow.open(map, marker);
                                    });
                                })(marker, RouteData);
                            }
                        }
                    })
                }
            }

            function SearchLocation(jsonData) {
                var obj = JSON.parse(jsonData);
                var pyrmont = new google.maps.LatLng(obj.lat,obj.lng);

                var mapOptions = {
                    center: pyrmont,
                    zoom: 8,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                    //  marker:true
                };
                //var infoWindow = new google.maps.InfoWindow();
                var map = new google.maps.Map(document.getElementById("dvCanvas"),mapOptions);
 
                alert(pyrmont);
                var request = {
                    location: pyrmont,
                    radius: '500',
                    types: ['store']
                };

                var service = new google.maps.places.PlacesService(map);
                service.search(request, callback);
            }

            function callback(results, status) {
                alert("in 2");
                if (status == google.maps.places.PlacesServiceStatus.OK) {
                    alert("in 3");
                    for (var i = 0; i < results.length; i++) {
                        var place = results[i];
                        alert("test");
                        //createMarker(results[i]);
                    }
                }
                alert(status);
            }

        </script>

         <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
                    <script type="text/javascript">
 
                        var markers = [
                        <asp:Repeater ID="rptMarkers" runat="server">
                        <ItemTemplate>
                                 {
                                     "title": '<%# Eval("title") %>',
                                 "lat": '<%# Eval("lat") %>',
                                 "lng": '<%# Eval("lng") %>',
                                 "description": '<%# Eval("description") %>',
                                 "icon": '<%# Eval("icon") %>'

                             }
                    </ItemTemplate>
                    <SeparatorTemplate>
            ,
        </SeparatorTemplate>
        </asp:Repeater>
                    ];
                    var Road = [
                <asp:Repeater ID="rptRoad" runat="server">
                <ItemTemplate>
                         {
                             "from": '<%# Eval("from") %>',
                                 "to": '<%# Eval("to") %>'

                             }
                    </ItemTemplate>
                    <SeparatorTemplate>
            ,
        </SeparatorTemplate>
        </asp:Repeater>
                        ];
    </script>
    <script type="text/javascript">
 
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat,markers[0].lng),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
                //  marker:true
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvCanvas"), mapOptions);
            var trafficLayer = new google.maps.TrafficLayer();
            trafficLayer.setMap(map);
            if(Road[0] != null)
            {
                var oldDirections = [];
                var currentDirections = null;
                var directionsDisplay;
                var directionsService = new google.maps.DirectionsService();//路線資訊回傳
                directionsDisplay = new google.maps.DirectionsRenderer({
                    polylineOptions: {
                        strokeColor: "black"
                    }});
                directionsDisplay.setMap(map);

                var request = {
                    origin : Road[0].from,
                    //中間點
                    //waypoints : [ {
                    //    location : point1,
                    //    stopover : true
                    //}, {
                    //    location : point2,
                    //    stopover : true
                    //} ],
                    destination : Road[0].to,
                    travelMode : google.maps.DirectionsTravelMode.DRIVING
                };
 
                directionsDisplay.setPanel(document.getElementById("Panel5"));
                	 
                google.maps.event.addListener(directionsDisplay, 'directions_changed',
                  function() {
                      //AlartMessage();
                      //if (currentDirections) {
                      //    oldDirections.push(currentDirections);        
                      //}

                      //currentDirections = directionsDisplay.getDirections();
                  });

                directionsService.route(request, function(response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        directionsDisplay.setDirections(response);
                        //showSteps(response);
                        var myRoute = response.routes[0].legs[0];
                        
                        for (var i = 0; i < myRoute.steps.length; i++) {
                            var RouteData = myRoute.steps[i];
                            var marker = new google.maps.Marker({
                                position: RouteData.start_location,
                                map: map
                            });
                            alert(RouteData.instructions);
                            (function (marker, RouteData) {
                                google.maps.event.addListener(marker, "click", function (e) {
                                    infoWindow.setContent(RouteData.instructions);
                                    alert(RouteData.instructions);
                                    //map.center =  new google.maps.LatLng(markers[0].lat,markers[0].lng),
                                    infoWindow.open(map, marker);
                                });
                            })(marker, myRoute);
                        }



                    }
                })
            }
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title,
                    icon:data.icon,
                    //animation: google.maps.Animation.BOUNCE
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        
                        //map.center =  new google.maps.LatLng(markers[0].lat,markers[0].lng),
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }

        


        function AlartMessage(){
            alert("test");
        }

        function showSteps(directionResult) {
            // For each step, place a marker, and add the text to the marker's
            // info window. Also attach the marker to an array so we
            // can keep track of it and remove it when calculating new
            // routes.
            var myRoute = directionResult.routes[0].legs[0];

            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat,markers[0].lng),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
                //  marker:true
            };

            var map = new google.maps.Map(document.getElementById("dvCanvas"), mapOptions);
            for (var i = 0; i < myRoute.steps.length; i++) {
                var marker = new google.maps.Marker({
                    position: myRoute.steps[i].start_location,
                    map: map
                });
                attachInstructionText(marker, myRoute.steps[i].instructions);
                //markerArray[i] = marker;
            }
        }

        function attachInstructionText(marker, text) {
            google.maps.event.addListener(marker, 'click', function() {
                var mapOptions = {
                    center: new google.maps.LatLng(markers[0].lat,markers[0].lng),
                    zoom: 8,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                    //  marker:true
                };
                var map = new google.maps.Map(document.getElementById("dvCanvas"), mapOptions);
                var infoWindow = new google.maps.InfoWindow();
                // Open an info window when the marker is clicked on,
                // containing the text of the step.
                infoWindow.setContent(text);
                        
                //map.center =  new google.maps.LatLng(markers[0].lat,markers[0].lng),
                infoWindow.open(map, marker);
            });
        }


    </script>
</head>
<body>

    <form id="form1" runat="server">

    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        
    <table>
        <tr>
            <td>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="Panel1" runat="server" Height="511px" Width="271px">
                    <asp:TreeView ID="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" Height="314px" Width="248px">
                        <Nodes>
                            <asp:TreeNode Text="環境監測數據" Value="環境監測數據">
                                <asp:TreeNode Text="天氣" Value="10"></asp:TreeNode>
                                <asp:TreeNode Text="輻射" Value="11"></asp:TreeNode>
                                <asp:TreeNode Text="紫外線" Value="12"></asp:TreeNode>
                                <asp:TreeNode Text="海面氣象" Value="13"></asp:TreeNode>
                                <asp:TreeNode Text="空氣品質" Value="14"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="緊急防災處理中心" Value="緊急防災處理中心">
                                <asp:TreeNode Text="海巡" Value="1"></asp:TreeNode>
                                <asp:TreeNode Text="派出所" Value="2"></asp:TreeNode>
                                <asp:TreeNode Text="消防隊" Value="3"></asp:TreeNode>
                                <asp:TreeNode Text="警察總局" Value="4"></asp:TreeNode>
                                <asp:TreeNode Text="醫院" Value="5"></asp:TreeNode>
                                <asp:TreeNode Text="應變中心" Value="6"></asp:TreeNode>
                                <asp:TreeNode Text="清潔隊" Value="7"></asp:TreeNode>
                                <asp:TreeNode Text="災民收容所" Value="8"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode Text="即時資訊" Value="即時資訊"></asp:TreeNode>
                        </Nodes>
                    </asp:TreeView>
                        
                </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                <%--<panel>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Button1" OnClick="Button2_Click" />
                         <asp:Button ID="Button3" runat="server" Text="Button1" OnClick="Button3_Click"  />
                </panel>--%>
                    
            </td>
            <td>
                <asp:Panel ID="Panel2" runat="server" Height="511px" Width="826px">

            <div id="dvCanvas" style="width: 825px; height: 509px">

    </div>
                </asp:Panel>
            </td>
            <td>
                
                        <asp:Panel ID="Panel3" runat="server" Height="511px" Width="276px">
                    <table>
                        
                        <tr>
                            <td>
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        
                                <table>
                                    <tr>
                            <td>
                                <asp:Label ID="UserNameLabel" runat="server" Text="帳號"></asp:Label>
                                <asp:TextBox ID="UserNameText" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="PasswordLabel" runat="server" Text="密碼"></asp:Label>
                                <asp:TextBox ID="PasswordText" runat="server"></asp:TextBox>
                                <asp:Button ID="LoginButton" runat="server" Text="登入" OnClick="LoginButton_Click" />
                                <asp:Button ID="RegisterButton" runat="server" Text="註冊" OnClick="RegisterButton_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="RegisterLabel" runat="server" Text="尚未登入"></asp:Label>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="GroupCreate" runat="server"></asp:TextBox>
                                <asp:Button ID="CreateButton" runat="server" Text="建立群組" OnClick="CreateButton_Click" />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="GroupID" runat="server"></asp:TextBox>
                                <asp:Button ID="AddGroup" runat="server" Text="加入群組" OnClick="AddGroup_Click" />

                                <asp:Button ID="Button1" runat="server"  Text="Button" OnClick="Button1_Click1" />

                            </td>
                        </tr>
                                    <tr>
                                        <td>
                                            
                                        </td>
                                    </tr>
                                </table>
                                </ContentTemplate>
                </asp:UpdatePanel>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:UpdatePanel runat="server" >
                                    <ContentTemplate>
                                        <asp:Panel ID="Panel6" runat="server" Height="350px" ScrollBars="Vertical">
                                        <asp:TreeView ID="TreeViewUser" runat="server"  Height="127px" Width="248px" OnSelectedNodeChanged="TreeViewUser_SelectedNodeChanged">
                            <Nodes>
                                <asp:TreeNode Text="守望相助群組" Value="環境監測數據">
                                    <asp:TreeNode Text="嘉義幫" Value="100">
                                        <asp:TreeNode Text="孫小美" Value="0"></asp:TreeNode>
                                        <asp:TreeNode Text="阿土伯" Value="1"></asp:TreeNode>
                                        <asp:TreeNode Text="愛力克斯" Value="2"></asp:TreeNode>
                                        <asp:TreeNode Text="帥哥" Value="3"></asp:TreeNode>

                                    </asp:TreeNode>
                                    <asp:TreeNode Text="大學組" Value="200">
                                        <asp:TreeNode Text="親愛的" Value="4"></asp:TreeNode>
                                        <asp:TreeNode Text="小三" Value="5"></asp:TreeNode>
                                        <asp:TreeNode Text="絲絲" Value="6"></asp:TreeNode>
                                    </asp:TreeNode>
                                </asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                                            </asp:Panel>
                                        <asp:Timer runat ="server" ID ="TreeTimer" Interval="10000" OnTick="TreeTimer_Tick"> 
                        </asp:Timer>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                
                                
                            </td>
                        </tr>
                        
                    </table>
                </asp:Panel>
                   
                
            </td>
        </tr>
    </table>
        <table>
            <tr>
                <td class="auto-style3">
                    <asp:Panel ID="Panel4" runat="server" Height="191px" Width="1381px">
                        <table>
                            <tr>
                                <td class="auto-style1">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="從"></asp:Label>
                                    <asp:TextBox ID="FormTextBox" runat="server" Height="24px" Width="229px"></asp:TextBox>
                                    <asp:Label ID="Label2" runat="server" Text="到"></asp:Label>
                                    <asp:TextBox ID="ToTextBox" runat="server" Height="24px" Width="229px"></asp:TextBox>
                                    <asp:Button ID="Search" runat="server" Text="路線規劃" OnClick="Search_Click" />
                                    <asp:Panel ID="Panel5" runat="server" Height="218px" ScrollBars="Vertical"></asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    
                                </td>
                                <td class="auto-style2">
                                    <asp:UpdatePanel Runat="server">
                                        <ContentTemplate>
                                             <asp:Menu id="Menu1" Orientation="Horizontal" Runat="server" OnMenuItemClick="Menu1_MenuItemClick">
                                            <Items>
                                            <asp:MenuItem Text="天氣特報" Value="0" />
                                            <%--<asp:MenuItem Text="行程建議" Value="1" />--%>
                                            <asp:MenuItem Text="聊天室" Value="1" />
                                            </Items>    
                                        </asp:Menu>
    
                                        <div class="tabContents">
                                            <asp:MultiView
                                                id="MultiView1"
                                                ActiveViewIndex="0"
                                                Runat="server">
                                                <asp:View ID="View1" runat="server" >
                                                    <table >
                                                        <tr>
                                                            <td >
                                                                <asp:ListBox ID="ListBoxAlarm" runat="server" Width="547px" Height="227px" SelectionMode="Multiple">
                                                                    
                                                                </asp:ListBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:View>        
                                                <%--<asp:View ID="View2" runat="server" >
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:ListBox ID="ListBox2" runat="server" Width="547px" Height="227px"></asp:ListBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:View>       --%> 
                                                <asp:View ID="View2" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:ListBox ID="ListBoxTalk" runat="server" Width="547px" Height="200px"></asp:ListBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="MessageText" runat="server" Width="485px"></asp:TextBox>
                                                                <asp:Button ID="SendButton" runat="server" Text="送出" OnClick="SendButton_Click"></asp:Button>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:View>          
                                            </asp:MultiView>
                                        </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                </asp:Panel>
                </td>
            </tr>
        </table>
                        
    </div>
        
    </form>
</body>
</html>
