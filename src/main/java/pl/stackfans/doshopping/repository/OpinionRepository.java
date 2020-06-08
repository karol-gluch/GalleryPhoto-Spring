package pl.stackfans.doshopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.stackfans.doshopping.model.Opinion;

import java.util.List;

public interface OpinionRepository extends JpaRepository<Opinion, Long> {

    @Query(value = "SELECT * FROM Opinion o where o.gallery_id = ?1", nativeQuery = true)
    List<Opinion> findOpinion(Long id);
}
