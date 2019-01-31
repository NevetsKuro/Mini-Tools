<%-- 
    Document   : locimgupload
    Created on : Jul 31, 2018, 11:37:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="all_links.jsp" %> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <script>


            function  check()
            {

                var formData = new FormData();
                formData.append("network", $('#files')[0].files[0]);
                formData.append("img1", $('#files')[0].files[0]);


                var form = $('#files')[0].files[0];

                var data = new FormData(form);

                alert("Ajax Function called");

                $.ajax({
                    type: "POST",
                    enctype: 'multipart/form-data',
                    url: "/Locimg",
                    data: data,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (data) {

                        $("#result").text(data);
                        console.log("SUCCESS : ", data);
                        $("#btnSubmit").prop("disabled", false);

                    },
                    error: function (e) {

                        $("#result").text(e.responseText);
                        console.log("ERROR : ", e);
                        $("#btnSubmit").prop("disabled", false);

                    }
                });





            }



        </script>



    </head>
    <body>
        <div id="main_container" class="hb">     
            <div id="header">
                <%@include file="header.jsp" %> 
            </div>
            <div id="menu-list" >
                <%@include file="menu_list.jsp" %>
            </div>
            <center>

                <h2>Upload Location Network Diagram And Images</h2>

            </center>



            <center>

                <table>
                    <h2>Network Diagram</h2>
                    <tr>
                        <td>
                            <input name="files" id="files" type="file" value="1"/>
                        </td>
                        <td>
                            <button type="submit" id="submit" class="btn btn-primary" >Upload</button>
                        </td>

                        <td> <a id="a"  class="hoverfile"  href="/IMS_WRO/Locimg" target="_blank">View Last Uploaded File</a></td>


                    </tr>
                </table>

                <table>

                    <h2>Network Room Images </h2>
                    <tr>
                        <td> <input name="files" id="files" type="file" /></td>
                        <td> <button type="submit" id="submit" class="btn btn-primary"  onclick="check()">Upload</button></td>
                        <td> <a id="a"  class="hoverfile"  href="/IMS_WRO/Locimg" target="_blank">View Last Uploaded File</a></td>
                    </tr>

                    <tr>
                        <td> <input name="files" id="files" type="file" /></td>
                        <td> <button type="submit" id="submit" class="btn btn-primary">Upload</button></td>
                        <td> <a id="a"  class="hoverfile"  href="/IMS_WRO/Locimg" target="_blank">View Last Uploaded File</a></td>
                    </tr>
                    <tr>
                        <td> <input name="files" id="files" type="file" /></td>
                        <td> <button type="submit" id="submit" class="btn btn-primary">Upload</button></td>
                        <td> <a id="a"  class="hoverfile"  href="/IMS_WRO/Locimg" target="_blank">View Last Uploaded File</a></td>
                    </tr>
                    <tr>
                        <td> <input name="files" id="files" type="file" /></td>
                        <td> <button type="submit" id="submit" class="btn btn-primary">Upload</button></td>
                        <td> <a id="a"  class="hoverfile"  href="/IMS_WRO/Locimg" target="_blank">View Last Uploaded File</a></td>
                    </tr>
                    <tr>
                        <td> <input name="files" data-nums="5" id="files" type="file" /></td>
                        <td> <button type="submit" id="submit" class="btn btn-primary">Upload</button></td>
                        <td> <a id="a"  class="hoverfile"  href="/IMS_WRO/Locimg" target="_blank">View Last Uploaded File</a></td>
                    </tr>


                </table>
            </center>
        </div>
        <div class="fb" id="footer">




            <footer>
                <div>
                    <h4> IS Dept.WRO</h4>
                </div>
            </footer>



        </div>



    </body>
</html>