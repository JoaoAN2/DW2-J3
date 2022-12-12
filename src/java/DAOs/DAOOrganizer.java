package DAOs;

import Entidades.Organizer;
import java.util.ArrayList;
import java.util.List;

public class DAOOrganizer extends DAOGenerico<Organizer> {

    public DAOOrganizer() {
        super(Organizer.class);
    }

    public int autoIdOrganizer() {
        Integer a = (Integer) em.createQuery("SELECT MAX(e.playerIdOrganizer) FROM organizere ").getSingleResult();
        if(a != null) {
            return a + 1;
        } else {
            return 1;
        }
    }
    public List<Organizer> listInOrderPlayerIdOrganizer() {
        return em.createQuery("SELECT e FROM organizer e ORDER BY e.player_id_organizer").getResultList();
    }

    public List<Organizer> listInOrderDailyPrice() {
        return em.createQuery("SELECT e FROM organizer e ORDER BY e.daily_price").getResultList();
    }

    public List<Organizer> listByNameOrganization(String nameOrganization) {
        return em.createQuery("SELECT e FROM organizer e WHERE e.name_organization LIKE :nameOrganization").setParameter("nameOrganization", "%" + nameOrganization + "%").getResultList();
    }

    public List<Organizer> listInOrderNameOrganization() {
        return em.createQuery("SELECT e FROM organizer e ORDER BY e.name_organization").getResultList();
    }

    public List<String> listInOrderString(String order) {
        List<Organizer> lf;
        if (order.equals("playerIdOrganizer")) {
            lf = listInOrderPlayerIdOrganizer();
        } else if (order.equals("dailyPrice")) {
            lf = listInOrderDailyPrice();
        } else if (order.equals("nameOrganization")) {
            lf = listInOrderNameOrganization();
        } else {
            lf = listInOrderPlayerIdOrganizer();
        }

        List<String> ls = new ArrayList<>();
        for (int i = 0; i < lf.size(); i++) {
            ls.add(lf.get(i).getPlayerIdOrganizer() + "-" + lf.get(i).getDailyPrice());
        }
        return ls;
    }

    public static void main(String[] args) {
        DAOOrganizer daoOrganizer = new DAOOrganizer();
        List<Organizer> listaOrganizer = daoOrganizer.list();
        for (Organizer organizer : listaOrganizer) {
            System.out.println(organizer);
        }
    }
}
