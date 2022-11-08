/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.auth;

import dal.AccountDBContext;
import dal.LecturerDBContext;
import dal.StudentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Lecturer;
import model.Student;


/**
 *
 * @author sonnt
 */
public class LoginController extends HttpServlet {
   
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDBContext db = new AccountDBContext();
        Account account = db.get(username, password);
        //String mess = "Login Failed!";
        if(account!=null)
        {
            request.getSession().setAttribute("account", account);
            LecturerDBContext ldb = new LecturerDBContext();
            Lecturer l = ldb.getAcReturnLecturer(account.getUsername());
            if(l!=null){
                response.sendRedirect("timetable?lid=" + l.getId());
            } else {
                StudentDBContext std = new StudentDBContext();
                Student s = std.getAcReturnStudent(account.getUsername());
                response.sendRedirect("stutimetable?stdid=" + s.getId());
            }
        }
        else
        {
            request.getSession().setAttribute("error", "*Account does not exist, please try again!");
            //response.getWriter().println("login failed!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
