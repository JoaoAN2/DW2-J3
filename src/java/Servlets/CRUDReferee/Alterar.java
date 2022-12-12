package Servlets.CRUDReferee;

import DAOs.DAOCatReferee;
import DAOs.DAOFederation;
import DAOs.DAOGender;
import DAOs.DAOReferee;
import DAOs.DAOTitle;
import Entidades.CatReferee;
import Entidades.Federation;
import Entidades.Gender;
import Entidades.Referee;
import Entidades.Title;
import Tools.DateTools;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author J³
 */
@WebServlet(name = "AlterarReferee", urlPatterns = {"/CRUDReferee/Alterar"})
public class Alterar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Referee referee = new Referee();
        DateTools dt = new DateTools();
        
        int id = Integer.valueOf(request.getParameter("id"));
        CatReferee catReferee = new DAOCatReferee().obter(request.getParameter("catReferee"));
        
        referee.setPlayerIdPlayer(id);
        referee.setCatRefereeIdReferee(catReferee);

        DAOReferee daoReferee = new DAOReferee();
        daoReferee.atualizar(referee);
        
        request.setAttribute("message", "Referee " + referee.getPlayerIdPlayer() + " atualizado com sucesso");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
