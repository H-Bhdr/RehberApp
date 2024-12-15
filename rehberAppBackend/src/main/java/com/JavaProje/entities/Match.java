package com.JavaProje.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "matches")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Match {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "guide_id", nullable = false)
    private Guide guide;

    @ManyToOne
    @JoinColumn(name = "traveller_id", nullable = false)
    private Traveller traveller;

    @ManyToOne
    @JoinColumn(name = "journey_id", nullable = false)
    private Journey journey;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private String status;

    public enum MatchStatus {
        ACTIVE,
        COMPLETED,
        CANCELLED
    }
}
