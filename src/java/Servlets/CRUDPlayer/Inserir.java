package Servlets.CRUDPlayer;

import DAOs.DAOFederation;
import DAOs.DAOGender;
import DAOs.DAOPlayer;
import DAOs.DAOTitle;
import Entidades.Federation;
import Entidades.Gender;
import Entidades.Player;
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
@WebServlet(name = "InserirPlayer", urlPatterns = {"/CRUDPlayer/Inserir"})
public class Inserir extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        Player player = new Player();
        DateTools dt = new DateTools();

        int id = Integer.valueOf(request.getParameter("id"));
        String name = (String) request.getParameter("name");
        int points = Integer.valueOf(request.getParameter("points"));
        Date birthday = dt.conversionStringInputDate(request.getParameter("birthday"));
        Federation federation = new DAOFederation().obter(request.getParameter("federation"));
        Gender gender = new DAOGender().obter(request.getParameter("gender"));
        Title title = new DAOTitle().obter(request.getParameter("title"));

        DAOPlayer daoPlayer = new DAOPlayer();
        if (daoPlayer.obter(id) == null) {
            player.setIdPlayer(id);
            player.setNamePlayer(name);
            player.setPointsPlayer(points);
            player.setBirthdayPlayer(birthday);
            player.setFederationSiglaPlayer(federation);
            player.setGenderSiglaPlayer(gender);
            player.setTitleSiglaPlayer(title);

            daoPlayer.inserir(player);
            request.setAttribute("message", "Jogador " + player.getIdPlayer() + ": " + player.getNamePlayer() + " inserido com sucesso");

        } else {
            request.setAttribute("message", "Jogador " + id + " já cadastrado!");
        }

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
