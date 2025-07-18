package Servlets.CRUDTournament;

import DAOs.DAOCity;
import DAOs.DAOTournament;
import Entidades.City;
import Entidades.Tournament;
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
@WebServlet(name = "AlterarTournament", urlPatterns = {"/CRUDTournament/Alterar"})
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
        try (PrintWriter out = response.getWriter()) {
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
        response.setContentType("text/html;charset=UTF-8");Tournament tournament = new Tournament();
        DateTools dt = new DateTools();
        
        int id = Integer.valueOf(request.getParameter("id"));
        Date start = dt.conversionStringInputDate(request.getParameter("start"));
        Date end = dt.conversionStringInputDate(request.getParameter("end"));
        int rounds = Integer.valueOf(request.getParameter("rounds"));
        City city = new DAOCity().obter(Integer.valueOf(request.getParameter("city")));

        tournament.setIdTournament(id);
        tournament.setStartDateTournament(start);
        tournament.setEndDateTournament(end);
        tournament.setRoundsTournament(rounds);
        tournament.setCityIdTournament(city);

        DAOTournament daoTournament = new DAOTournament();
        daoTournament.atualizar(tournament);

        request.setAttribute("message", "Tournament " + tournament.getIdTournament()+ " atualizado com sucesso");
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
