package pl.stackfans.doshopping.model;


import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="gallery")
public class Gallery {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String tytul;
    private String opis;
    private String dataDodania;

    @OneToMany(mappedBy = "gallery")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<GalleryPhoto> galleryPhoto;

    @ManyToOne()
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    private Category category;

    @OneToMany(mappedBy = "user")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Set<Opinion> opinion;

    public Gallery(String tytul, String opis) {
        this.tytul = tytul;
        this.opis = opis;
    }

    public Gallery(String tytul, String opis, Set<GalleryPhoto> galleryPhoto) {
        this.tytul = tytul;
        this.opis = opis;
        this.galleryPhoto = galleryPhoto;
    }

    public Gallery() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTytul() {
        return tytul;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Set<GalleryPhoto> getGalleryPhoto() {
        return galleryPhoto;
    }

    public void setGalleryPhoto(Set<GalleryPhoto> galleryPhoto) {
        this.galleryPhoto = galleryPhoto;
    }

    public String getDataDodania() {
        return dataDodania;
    }

    public void setDataDodania(String dataDodania) {
        this.dataDodania = dataDodania;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Set<Opinion> getOpinion() {
        return opinion;
    }

    public void setOpinion(Set<Opinion> opinion) {
        this.opinion = opinion;
    }
}
