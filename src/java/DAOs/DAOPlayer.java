package DAOs;

import static DAOs.DAOGenerico.em;
import Entidades.Player;
import Entidades.Tournaments;
import java.util.ArrayList;
import java.util.List;

public class DAOPlayer extends DAOGenerico<Player> {

    public DAOPlayer() {
        super(Player.class);
    }

    @Override
    public Player obter(String email) {
        try {
            return (Player) em.createQuery("SELECT e FROM Player e WHERE e.email=:email").setParameter("email", email).getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Player> getTopTen() {
        return em.createQuery("SELECT e FROM Player e ORDER BY e.pointsPlayer DESC").setMaxResults(10).getResultList();
    }
    
    public List<Player> listPlayersFromTournament(Tournaments tournaments) {
        return em.createQuery("SELECT e FROM tournaments e ORDER BY e.tournaments_id_tournament").getResultList();
    }
    
    public int autoIdPlayer() {
        Integer a = (Integer) em.createQuery("SELECT MAX(e.idPlayer) FROM playere ").getSingleResult();
        if (a != null) {
            return a + 1;
        } else {
            return 1;
        }
    }

    public static void main(String[] args) {
        DAOPlayer daoPlayer = new DAOPlayer();
        List<Player> listaPlayer = daoPlayer.list();
        for (Player player : listaPlayer) {
            System.out.println(player);
        }
    }
}
