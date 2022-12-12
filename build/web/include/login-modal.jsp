<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="login-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="Auth" method="POST">
                    <div class="row">
                        <div class="col-12">
                            <input type="email" placeholder="Email do jogador" required name="email" class="form-control mb-2"/>
                        </div>
                        <div class="col-12">
                            <input type="password" placeholder="Senha" required name="password" class="form-control mb-2"/>
                        </div>
                    </div>
                    <button class="btn btn-success mb-3" type="submit">Entrar</button>
                </form>
                <span>Ainda não possui uma conta? <a data-bs-toggle="modal" data-bs-target="#register-modal" href="#">Registre-se</a></span>
            </div>
        </div>
    </div>
</div>
