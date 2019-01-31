/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package package1;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dataProcessor extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String name = request.getParameter("name");
        int flag = Integer.parseInt(request.getParameter("flag"));
        System.out.println("Processor Running");
        PrintWriter pw = response.getWriter();
        
        if(name.contains("eve")){
            System.out.println("Log: Name:"+name);
//            pw.println("Successfully logged"+ name);
//            response.getWriter().println("success for "+name);
            name = name + "  Yesss";
            new Gson().toJson(name, pw);
        }else if(!name.contains("Steven")){
//            response.sendError(response.SC_BAD_REQUEST, "Unsuccesful");
            pw.println("Unsuccesful logged: "+name);
        }
    }

}
