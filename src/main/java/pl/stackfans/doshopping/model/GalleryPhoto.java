package pl.stackfans.doshopping.model;


import javax.persistence.*;
import java.util.Base64;

@Entity
@Table(name = "gallery_photo")
public class GalleryPhoto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Lob
    private byte[] photo;
    @ManyToOne()
    @JoinColumn(name = "gallery_id", referencedColumnName = "id")
    private Gallery gallery;

    public GalleryPhoto(byte[] photo, Gallery gallery) {
        this.photo = photo;
        this.gallery = gallery;
    }

    public GalleryPhoto() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public String getPhoto1(){
        return Base64.getEncoder().encodeToString(photo);
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public Gallery getGallery() {
        return gallery;
    }

    public void setGallery(Gallery gallery) {
        this.gallery = gallery;
    }
}
