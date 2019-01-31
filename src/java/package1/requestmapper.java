/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package package1;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class requestmapper extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String url = request.getParameter("url");
        
        switch(url){
            case "profile":
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                break;
            case "qrcode":
                request.getRequestDispatcher("QRCode.jsp").forward(request, response);
                break;
            default:
                response.getWriter().println("Page Not Found");
        }
    }

}
