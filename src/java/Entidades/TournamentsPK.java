/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author joaoan2
 */
@Embeddable
public class TournamentsPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "tournaments_id_tournament")
    private int tournamentsIdTournament;
    @Basic(optional = false)
    @Column(name = "tournaments_id_player")
    private int tournamentsIdPlayer;

    public TournamentsPK() {
    }

    public TournamentsPK(int tournamentsIdTournament, int tournamentsIdPlayer) {
        this.tournamentsIdTournament = tournamentsIdTournament;
        this.tournamentsIdPlayer = tournamentsIdPlayer;
    }

    public int getTournamentsIdTournament() {
        return tournamentsIdTournament;
    }

    public void setTournamentsIdTournament(int tournamentsIdTournament) {
        this.tournamentsIdTournament = tournamentsIdTournament;
    }

    public int getTournamentsIdPlayer() {
        return tournamentsIdPlayer;
    }

    public void setTournamentsIdPlayer(int tournamentsIdPlayer) {
        this.tournamentsIdPlayer = tournamentsIdPlayer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) tournamentsIdTournament;
        hash += (int) tournamentsIdPlayer;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TournamentsPK)) {
            return false;
        }
        TournamentsPK other = (TournamentsPK) object;
        if (this.tournamentsIdTournament != other.tournamentsIdTournament) {
            return false;
        }
        if (this.tournamentsIdPlayer != other.tournamentsIdPlayer) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return tournamentsIdTournament + ";" + tournamentsIdPlayer;
    }    
}
