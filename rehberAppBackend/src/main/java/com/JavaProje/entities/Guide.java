package com.JavaProje.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "guides")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Guide {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "expertise_area", nullable = false)
    private String expertiseArea;  // Rehberin uzmanlık alanı

    @Column(name = "description", nullable = false)
    private String description;  // Rehberin kendini tanıttığı açıklama
}
