package pl.stackfans.doshopping.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.stackfans.doshopping.model.Category;
import pl.stackfans.doshopping.model.Gallery;
import pl.stackfans.doshopping.model.Opinion;
import pl.stackfans.doshopping.model.User;
import pl.stackfans.doshopping.repository.GalleryRepository;
import pl.stackfans.doshopping.repository.OpinionRepository;
import pl.stackfans.doshopping.repository.UserRepository;
import pl.stackfans.doshopping.service.SecurityService;
import pl.stackfans.doshopping.service.UserService;
import pl.stackfans.doshopping.validator.UserValidator;

import java.util.List;

@Controller
public class UserController {
    private final UserService userService;
    private final SecurityService securityService;
    private final UserValidator userValidator;
    private final GalleryRepository galleryRepository;
    private final UserRepository userRepository;
    private final OpinionRepository opinionRepository;

    public UserController(UserService userService, SecurityService securityService, UserValidator userValidator, GalleryRepository galleryRepository, UserRepository userRepository, OpinionRepository opinionRepository) {
        this.userService = userService;
        this.securityService = securityService;
        this.userValidator = userValidator;
        this.galleryRepository = galleryRepository;
        this.userRepository = userRepository;
        this.opinionRepository = opinionRepository;
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "index";
        }
        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
        return "redirect:/index";
    }


    @GetMapping("/login")
    public String login(Model model) {
        return "index";
    }


    @GetMapping({"/","/index"})
    public String index(Model model) {
        return "index";
    }

    @GetMapping({"/addCategory","/addCategory/{id}"})
    public String addCategory(Model model) {
        return "addCategory";
    }

    @GetMapping({"/deletePhoto","/deletePhoto/{id}"})
    public String deletePhoto(Model model) {
        List<Gallery> gallery = galleryRepository.findAll();
        model.addAttribute("gallery", gallery);
        return "deletePhoto";
    }

    @GetMapping({"/users","/users/{id}"})
    public String users(Model model) {
        List<User> users = userRepository.findUsers();
        model.addAttribute("users", users);
        return "users";
    }

    @GetMapping({"/pomoc","/pomoc/{id}"})
    public String pomoc(Model model) {
        return "pomoc";
    }

    @GetMapping({"/opinions","/opinions/{id}"})
    public String opinions(Model model) {
        List<Opinion> opinions = opinionRepository.findAll();
        model.addAttribute("opinions", opinions);
        return "opinions";
    }
}


