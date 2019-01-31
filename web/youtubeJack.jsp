<%-- 
    Document   : youtubeJack
    Created on : 17 Dec, 2018, 12:27:37 PM
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

        <section>
            <label>
                <strong>Youtube Link:</strong>
                <textarea id="youtubeLink" placeholder="Paste Link"></textarea>
                <input type="button" id="youtubeLinkSub" value="submit">
            </label>
            <div>
                <iframe id="hackable" src=""
                        width="560" height="315" frameborder="0" allowfullscreen></iframe>
            </div>
            <div>
                <object id="hackable2" data=""
                        width="560" height="315"></object>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script>
            function getId(url) {
                var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
                var match = url.match(regExp);

                if (match && match[2].length == 11) {
                    return match[2];
                } else {
                    return 'error';
                }
            }
            $(document).ready(function () {
                $(document).on('click', '#youtubeLinkSub', function () {

                    var myId = getId($('#youtubeLink').val());
                    $('#myId').html(myId);


                    $(this).val() ? $('#hackable').attr('src',  'https://www.youtube-nocookie.com/embed/' + myId) : alert('Paste a link!!');
                    $(this).val() ? $('#hackable2').attr('data', 'https://www.youtube-nocookie.com/embed/' + myId) : alert('Paste a link!!');
                });
            });
        </script>
    </body>
</html>
