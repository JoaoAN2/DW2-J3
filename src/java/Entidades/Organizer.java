/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author joaoan2
 */
@Entity
@Table(name = "organizer")
@NamedQueries({
    @NamedQuery(name = "Organizer.findAll", query = "SELECT o FROM Organizer o"),
    @NamedQuery(name = "Organizer.findByPlayerIdOrganizer", query = "SELECT o FROM Organizer o WHERE o.playerIdOrganizer = :playerIdOrganizer"),
    @NamedQuery(name = "Organizer.findByDailyPrice", query = "SELECT o FROM Organizer o WHERE o.dailyPrice = :dailyPrice"),
    @NamedQuery(name = "Organizer.findByNameOrganization", query = "SELECT o FROM Organizer o WHERE o.nameOrganization = :nameOrganization")})
public class Organizer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "player_id_organizer")
    private Integer playerIdOrganizer;
    @Basic(optional = false)
    @Column(name = "daily_price")
    private double dailyPrice;
    @Basic(optional = false)
    @Column(name = "name_organization")
    private String nameOrganization;
    @JoinColumn(name = "player_id_organizer", referencedColumnName = "id_player", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Player player;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "organizerIdTournament")
    private List<Tournament> tournamentList;

    public Organizer() {
    }

    public Organizer(Integer playerIdOrganizer) {
        this.playerIdOrganizer = playerIdOrganizer;
    }

    public Organizer(Integer playerIdOrganizer, double dailyPrice, String nameOrganization) {
        this.playerIdOrganizer = playerIdOrganizer;
        this.dailyPrice = dailyPrice;
        this.nameOrganization = nameOrganization;
    }

    public Integer getPlayerIdOrganizer() {
        return playerIdOrganizer;
    }

    public void setPlayerIdOrganizer(Integer playerIdOrganizer) {
        this.playerIdOrganizer = playerIdOrganizer;
    }

    public double getDailyPrice() {
        return dailyPrice;
    }

    public void setDailyPrice(double dailyPrice) {
        this.dailyPrice = dailyPrice;
    }

    public String getNameOrganization() {
        return nameOrganization;
    }

    public void setNameOrganization(String nameOrganization) {
        this.nameOrganization = nameOrganization;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public List<Tournament> getTournamentList() {
        return tournamentList;
    }

    public void setTournamentList(List<Tournament> tournamentList) {
        this.tournamentList = tournamentList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (playerIdOrganizer != null ? playerIdOrganizer.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Organizer)) {
            return false;
        }
        Organizer other = (Organizer) object;
        if ((this.playerIdOrganizer == null && other.playerIdOrganizer != null) || (this.playerIdOrganizer != null && !this.playerIdOrganizer.equals(other.playerIdOrganizer))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return playerIdOrganizer + ";" + dailyPrice + ";" + nameOrganization;
    }    
}
