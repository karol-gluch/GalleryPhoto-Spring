package pl.stackfans.doshopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.stackfans.doshopping.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
