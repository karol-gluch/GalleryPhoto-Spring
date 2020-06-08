package pl.stackfans.doshopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.stackfans.doshopping.model.Gallery;

import java.util.List;

public interface GalleryRepository extends JpaRepository<Gallery, Long> {
    @Query(value="SELECT * FROM Gallery g ORDER BY DATA_DODANIA DESC", nativeQuery = true)
    List<Gallery> findByDateR();

    @Query(value="SELECT * FROM Gallery g ORDER BY DATA_DODANIA ASC", nativeQuery = true)
    List<Gallery> findByDateM();

    @Query(value="SELECT * FROM Gallery g WHERE G.CATEGORY_ID = ?1", nativeQuery = true)
    List<Gallery> findCategory(long id);
}
