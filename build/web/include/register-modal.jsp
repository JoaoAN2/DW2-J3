<%@page import="Entidades.Title"%>
<%@page import="DAOs.DAOTitle"%>
<%@page import="Entidades.Gender"%>
<%@page import="DAOs.DAOGender"%>
<%@page import="Entidades.Federation"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.DAOFederation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="host_path" value="${header['host']}${pageContext.servletContext.contextPath}"/>
<!-- Modal -->
<div class="modal fade" id="register-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Login title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="Register" method="POST" enctype="multipart/form-data">
                    <input type="email" class="form-control mb-3" placeholder="Email do Jogador" name="email" required>
                    <input type="password" class="form-control mb-3" placeholder="Senha" required name="password"/>
                    <input type="text" class="form-control mb-3" placeholder="Nome do jogador" name="name" required >
                    <input type="date" class="form-control mb-3" placeholder="Data de Nascimento" name="birthday" required >
                    <select class="form-select mb-3" name="federation">
                        <%
                            DAOFederation daoFederation = new DAOFederation();
                            List<Federation> resultFederation = daoFederation.list();
                            if (resultFederation.size() != 0) {
                                for (int i = 0; i < resultFederation.size(); i++) {
                                    out.println("<option value=\"" + resultFederation.get(i).getSiglaFederation() + "\">" + resultFederation.get(i).getNameFederation() + "</option>");
                                }
                            }
                        %>
                    </select>
                    <select class="form-select mb-3" name="gender">
                        <%
                            DAOGender daoGender = new DAOGender();
                            List<Gender> resultGender = daoGender.list();
                            if (resultGender.size() != 0) {
                                for (int i = 0; i < resultGender.size(); i++) {
                                    out.println("<option value=\"" + resultGender.get(i).getSiglaGender() + "\">" + resultGender.get(i).getFullGender() + "</option>");
                                }
                            }
                        %>
                    </select>
                    <select class="form-select mb-3" name="title">
                        <%
                            DAOTitle daoTitle = new DAOTitle();
                            List<Title> resultTitle = daoTitle.list();
                            if (resultTitle.size() != 0) {
                                for (int i = 0; i < resultTitle.size(); i++) {
                                    out.println("<option value=\"" + resultTitle.get(i).getSiglaTitle() + "\">" + resultTitle.get(i).getNameTitle() + "</option>");
                                }
                            }
                        %>
                    </select>
                    <input type="file" name="profile-picture" class="form-control mb-3"/>
                    <button class="btn btn-success mb-3" type="submit" >Criar conta</button>
                </form>
                <span>Já possui uma conta? Faça <a data-bs-toggle="modal" data-bs-target="#login-modal" href="#">Login</a></span>
            </div>
        </div>
    </div>
</div>