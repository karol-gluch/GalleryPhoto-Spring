package pl.stackfans.doshopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.stackfans.doshopping.model.Gallery;
import pl.stackfans.doshopping.model.GalleryPhoto;

import java.util.List;

public interface GalleryPhotoRepository extends JpaRepository<GalleryPhoto, Long> {
@Query("SELECT GP FROM GalleryPhoto GP WHERE GP.photo = :id")
    List<GalleryPhoto> findPhotoWithGalleryId(@Param("id")Gallery id);
}
