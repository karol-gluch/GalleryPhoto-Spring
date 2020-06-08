package pl.stackfans.doshopping.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.stackfans.doshopping.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}