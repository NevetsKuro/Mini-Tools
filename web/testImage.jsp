<%@page import="java.util.Base64"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    
    String driver = "oracle.jdbc.driver.OracleDriver";
    String connectionUrl = "jdbc:oracle:thin:@10.146.64.194:1521";
    String database = "MKTORADB";
    String userid = "IMS_WRO";
    String password = "india";
    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    Connection connection = null;
    Statement statement = null;
    ResultSet res = null;

//    
//        try {
//    }
//    catch (ClassNotFoundException e
//
//    
//        ) {
//e.printStackTrace();
//    }

%>

<%!
    public String convertToString(Blob b) {
        String base64Image = "";
        try {
            InputStream is = b.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = is.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            byte[] imageBytes = outputStream.toByteArray();
            base64Image = Base64.getEncoder().encodeToString(imageBytes);
//                System.out.println("this is it "+base64Image.substring(1, 100));

            is.close();
            outputStream.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return base64Image;
    }
%>
<!DOCTYPE html>
<html>
    <body>
        <%            
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();
                String sql = "select NETWORK_DIAG,IMG1,IMG2,IMG3,IMG4,IMG5 FROM locationimage where location=3000";
                res = statement.executeQuery(sql);
                List ls = new ArrayList<String>();
                while (res.next()) {
                    ls.add(convertToString(res.getBlob(1)));
                    ls.add(convertToString(res.getBlob(2)));
                    ls.add(convertToString(res.getBlob(3)));
                    ls.add(convertToString(res.getBlob(4)));
                    ls.add(convertToString(res.getBlob(5)));
                    ls.add(convertToString(res.getBlob(6)));
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <h1>gallery made with nanogallery2</h1>

        <div id="nanogallery2" data-nanogallery2='{
             "thumbnailHeight":         210, "thumbnailWidth": 210,
             "thumbnailL1GutterWidth":  90,
             "itemsBaseURL":            "http://nanogallery2.nanostudio.org/samples/"
             }'>
            <img src="resources/images/w-movies.jpg" alt=""/>
            <!-- IMAGES -->
            <a href="https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg" data-ngthumb="https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg">Berlin 1</a>
            <a href="data:image/jpg;base64,${imageString}" data-ngthumb="data:image/jpg;base64,${imageString}">Berlin 1</a>

            <!--      <a href="https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg" data-ngthumb="https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg">Berlin 2</a>
                  <a href="https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg" data-ngthumb="https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg">Berlin 3</a>-->
        </div>
    </body>
</html>



