/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import dal.AttandanceDBContext;
import dal.SessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Attandance;
import model.Session;
import model.Student;

/**
 *
 * @author dell
 */
public class AttController extends HttpServlet {
   
    
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int sesid = Integer.parseInt(request.getParameter("id"));
        AttandanceDBContext attDB = new AttandanceDBContext();
        ArrayList<Attandance> atts = attDB.getAttsBySessionId(sesid);
        request.setAttribute("atts", atts); 
        SessionDBContext sesDB = new SessionDBContext();
        Session ses = sesDB.get(sesid);
        request.setAttribute("ses", ses);
        request.getRequestDispatcher("/attview").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("sesid")));
        String[] stdids = request.getParameterValues("stdid");
        for (String stdid : stdids) {
            Attandance a =new Attandance();
            Student s = new Student();
            a.setStudent(s);
            a.setDescription(request.getParameter("description"+stdid));
            a.setPresent(request.getParameter("present"+stdid).equals("present"));
            s.setId(Integer.parseInt(stdid));
            ses.getAtts().add(a);
        }
        SessionDBContext db = new SessionDBContext();
        db.update(ses);
        response.sendRedirect("takeatt?id="+ses.getId());
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
   
}
