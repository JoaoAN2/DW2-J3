/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import DAOs.DAOFederation;
import DAOs.DAOGender;
import DAOs.DAOPlayer;
import DAOs.DAOTitle;
import Entidades.Federation;
import Entidades.Gender;
import Entidades.Player;
import Entidades.Title;
import Tools.DateTools;
import Tools.ManipulaArquivo;
import Tools.StringTools;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author joaoan2
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
@MultipartConfig
public class Register extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        Player player = new Player();
        DateTools dt = new DateTools();
        StringTools st = new StringTools();

        String name = st.inputStreamToString(request.getPart("name").getInputStream());
        String password = st.inputStreamToString(request.getPart("password").getInputStream());
        // int points = Integer.parseInt(st.inputStreamToString(request.getPart("points").getInputStream()));
        Date birthday = dt.conversionStringInputDate(st.inputStreamToString(request.getPart("birthday").getInputStream()));
        Federation federation = new DAOFederation().obter(st.inputStreamToString(request.getPart("federation").getInputStream()));
        Gender gender = new DAOGender().obter(st.inputStreamToString(request.getPart("gender").getInputStream()));
        Title title = new DAOTitle().obter(st.inputStreamToString(request.getPart("title").getInputStream()));
        String email = st.inputStreamToString(request.getPart("email").getInputStream());
        Part profilePicture = request.getPart("profile-picture");

        DAOPlayer daoPlayer = new DAOPlayer();

        try {
            
            player.setNamePlayer(name);
            player.setPointsPlayer(1200);
            player.setBirthdayPlayer(birthday);
            player.setFederationSiglaPlayer(federation);
            player.setGenderSiglaPlayer(gender);
            player.setTitleSiglaPlayer(title);
            player.setEmail(email);
            player.setPassword(password);

            daoPlayer.inserir(player);
            
            Player newUser = daoPlayer.obter(email);
            ManipulaArquivo manipulaArquivo = new ManipulaArquivo();
            String path = "/home/joaoan2/projects/DW2-J3/build/web/uploads/users/" + newUser.getIdPlayer() + "/profile-picture";
            manipulaArquivo.criarDiretorio(new File(path));
            profilePicture.write(path + File.separator + profilePicture.getSubmittedFileName());
            newUser.setProfilePictureUrl("/DW2-J3/uploads/users/" + newUser.getIdPlayer() + "/profile-picture" + File.separator + profilePicture.getSubmittedFileName());
            
            daoPlayer.atualizar(newUser);
            
            HttpSession session = request.getSession();
            session.setAttribute("user", daoPlayer.obter(newUser.getIdPlayer()));
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.out.println(e);
        }
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
