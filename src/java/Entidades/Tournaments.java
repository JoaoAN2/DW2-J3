/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidades;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author joaoan2
 */
@Entity
@Table(name = "tournaments")
@NamedQueries({
    @NamedQuery(name = "Tournaments.findAll", query = "SELECT t FROM Tournaments t"),
    @NamedQuery(name = "Tournaments.findByTournamentsIdTournament", query = "SELECT t FROM Tournaments t WHERE t.tournamentsPK.tournamentsIdTournament = :tournamentsIdTournament"),
    @NamedQuery(name = "Tournaments.findByTournamentsIdPlayer", query = "SELECT t FROM Tournaments t WHERE t.tournamentsPK.tournamentsIdPlayer = :tournamentsIdPlayer"),
    @NamedQuery(name = "Tournaments.findByPositionPlayer", query = "SELECT t FROM Tournaments t WHERE t.positionPlayer = :positionPlayer")})
public class Tournaments implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TournamentsPK tournamentsPK;
    @Column(name = "position_player")
    private Integer positionPlayer;
    @JoinColumn(name = "tournaments_id_player", referencedColumnName = "id_player", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Player player;
    @JoinColumn(name = "tournaments_id_tournament", referencedColumnName = "id_tournament", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Tournament tournament;

    public Tournaments() {
    }

    public Tournaments(TournamentsPK tournamentsPK) {
        this.tournamentsPK = tournamentsPK;
    }

    public Tournaments(int tournamentsIdTournament, int tournamentsIdPlayer) {
        this.tournamentsPK = new TournamentsPK(tournamentsIdTournament, tournamentsIdPlayer);
    }

    public TournamentsPK getTournamentsPK() {
        return tournamentsPK;
    }

    public void setTournamentsPK(TournamentsPK tournamentsPK) {
        this.tournamentsPK = tournamentsPK;
    }

    public Integer getPositionPlayer() {
        return positionPlayer;
    }

    public void setPositionPlayer(Integer positionPlayer) {
        this.positionPlayer = positionPlayer;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tournamentsPK != null ? tournamentsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tournaments)) {
            return false;
        }
        Tournaments other = (Tournaments) object;
        if ((this.tournamentsPK == null && other.tournamentsPK != null) || (this.tournamentsPK != null && !this.tournamentsPK.equals(other.tournamentsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return tournamentsPK + ";" + positionPlayer;
    }    
}
