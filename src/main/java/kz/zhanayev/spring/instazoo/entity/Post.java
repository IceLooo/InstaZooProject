package kz.zhanayev.spring.instazoo.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Table(name = "posts")
@Data
@Entity
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String caption;
    private String location;
    private Integer likes;


    @Column
    @ElementCollection(targetClass = String.class)
    private Set<String> likedUsers = new HashSet<>();

    @ManyToOne
    private User user;

    @OneToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER,
            mappedBy = "post", orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    @Column(updatable = false)
    private LocalDateTime createdDate;

    @PrePersist
    protected void onCreate(){
        this.createdDate = LocalDateTime.now();
    }
}
