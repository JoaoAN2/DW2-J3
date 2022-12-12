package DAOs;

import static DAOs.DAOGenerico.em;
import Entidades.Player;
import Entidades.Tournament;
import Entidades.TournamentsPK;
import Entidades.Tournaments;
import java.util.ArrayList;
import java.util.List;

public class DAOTournaments extends DAOGenerico<Tournaments> {

    public DAOTournaments() {
        super(Tournaments.class);
    }

    public Tournaments obter(TournamentsPK tournamentsPK){
        return em.find(Tournaments.class, tournamentsPK);
    }
    
    public List<Player> getPlayersInTournament(Tournament tournament) {
        List<Player> players = new ArrayList();
        for (Tournaments tournaments : tournament.getTournamentsList()) {
            players.add(tournaments.getPlayer());
        }
        return players;
    }
    
    public static void main(String[] args) {
        DAOTournaments daoTournaments = new DAOTournaments();
        List<Player> listaTournaments = daoTournaments.getPlayersInTournament(new DAOTournament().obter(1));
        for (Player tournaments : listaTournaments) {
            System.out.println(tournaments);
        }
    }
}
