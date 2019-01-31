<%-- 
    Document   : QRCode
    Created on : 31 Aug, 2018, 11:36:09 AM
    Author     : wrtrg2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <!DOCTYPE html>
            <script type="text/javascript">
            //This entire block of script should be in a separate file, and included in each doc in which you want scanner capabilities
                function zxinglistener(e){
                    localStorage["zxingbarcode"] = "";
                    if(e.url.split("\#")[0] == window.location.href){
                        window.focus();
                        processBarcode(decodeURIComponent(e.newValue));
                    }
                    window.removeEventListener("storage", zxinglistener, false);
                }
                if(window.location.hash != ""){
                    localStorage["zxingbarcode"] = window.location.hash.substr(1);
                    self.close();
                    window.location.href="about:blank";//In case self.close is disabled
                }else{
                    window.addEventListener("hashchange", function(e){
                        window.removeEventListener("storage", zxinglistener, false);
                        var hash = window.location.hash.substr(1);
                        if (hash != "") {
                            window.location.hash = "";
                            processBarcode(decodeURIComponent(hash));
                        }
                    }, false);
                }
                function getScan(){
                    var href = window.location.href.split("\#")[0];
                    window.addEventListener("storage", zxinglistener, false);
                    zxingWindow = window.open("zxing://scan/?ret=" + encodeURIComponent(href + "1235413"),'_self');
                }

            </script>
            <script type="text/javascript">
                function processBarcode(b){
                    var d = document.createElement("div");
                    d.innerHTML = b;
                    document.body.appendChild(d);
                }
            </script>
            <button onclick="getScan()">get Scan</button>
        
        
        
        
        <div id="qrcode"></div>
        <div>
        <section>
            <label>Enter Code:</label>
            <!--<input type="text" id="qrCodez" name="qr_code" placeholder="Enter Code for Converting">-->
            <textarea id="qrCodez" name="qr_code" rows="3" placeholder="Enter Code for Converting"></textarea>
        </section>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="resources/js/qrcode.min.js" type="text/javascript"></script>
        <script type="text/javascript">
//            new QRCode(document.getElementById("qrcode"), "Steven");
        

        $(document).ready(function() {
                $(document).on('keyup','#qrCodez',function () {
                    qrcode.clear(); // clear the code.
                    qrcode.makeCode($(this).val()); // make another code.
                });
        });

        var qrcode = new QRCode(document.getElementById("qrcode"), {
                text: "Steven Fernandes",
                width: 128,
                height: 128,
                colorDark : "#407848",
                colorLight : "#ffffff",
                correctLevel : QRCode.CorrectLevel.H
        });
        </script>
    </body>
</html>
