package pl.stackfans.doshopping.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.stackfans.doshopping.model.*;
import pl.stackfans.doshopping.repository.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class FormController {

    private final GalleryRepository galleryRepository;
    private final GalleryPhotoRepository galleryPhotoRepository;
    private final CategoryRepository categoryRepository;
    private final UserRepository userRepository;
    private final OpinionRepository opinionRepository;

    public FormController(GalleryRepository galleryRepository, GalleryPhotoRepository galleryPhotoRepository, CategoryRepository categoryRepository, UserRepository userRepository, UserRepository userRepository1, OpinionRepository opinionRepository) {
        this.galleryRepository = galleryRepository;
        this.galleryPhotoRepository = galleryPhotoRepository;
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository1;
        this.opinionRepository = opinionRepository;
    }

    @GetMapping({"/addPhoto", "/addPhoto/{id}"})
    public String addPhoto(@PathVariable Optional<Long> id, Model model) {
        if(id.isEmpty()) {
            Gallery newGallery = new Gallery();
            galleryRepository.save(newGallery);

            List<Category> category = categoryRepository.findAll();

            model.addAttribute("category" ,category);
            model.addAttribute("id", newGallery.getId());
        }
        return "addPhoto";
    }

    @PostMapping({"/addImage","/addImage/{id}"})
    public String addImage(@PathVariable long id , @ModelAttribute("photos") List<MultipartFile> photos, Model model){
        photos.forEach( x -> {
            try {
                byte[] xd = x.getBytes();
                galleryPhotoRepository.save(new GalleryPhoto(xd,galleryRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Gallery is empty!"))));
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        List<Category> category = categoryRepository.findAll();
        model.addAttribute("category" ,category);
        model.addAttribute("id",id);
        return "addPhoto";
    }

    @PostMapping({"/addGallery","/addGallery/{id}"})
    public String addGallery(@PathVariable long id, @ModelAttribute("galleryForm") Gallery galleryForm, RedirectAttributes redirectAttributes){
        Gallery g = galleryRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Empty gallery"));
        g.setTytul(galleryForm.getTytul());
        g.setOpis(galleryForm.getOpis());
        g.setCategory(galleryForm.getCategory());

        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String strDate = dateFormat.format(date);

        g.setDataDodania(strDate);
        galleryRepository.save(g);
        redirectAttributes.addFlashAttribute("photo", "true");

        return "redirect:/adminPanel";
    }


    @GetMapping({"/gallery"})
    public String gallery(Model model) {
        List<Gallery> gallery = galleryRepository.findAll();
        List<Category> category = categoryRepository.findAll();
        model.addAttribute("category" ,category);
        model.addAttribute("gallery", gallery);
        return "gallery";
    }

    @GetMapping({"/sort", "/sort/{id}"})
    public String sort(@PathVariable long id, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        if(id == 1) {
            List<Gallery> gallery = galleryRepository.findByDateR();
            model.addAttribute("gallery",gallery);
        }
        if(id == 2) {
            List<Gallery> gallery = galleryRepository.findByDateM();
            model.addAttribute("gallery",gallery);
        }
        if(id == 3) {
            String cId = request.getParameter("category");
            Long cid = Long.valueOf(cId);
            if(cid == 0)
            {
                List <Gallery> gallery = galleryRepository.findAll();
                model.addAttribute("gallery", gallery);
            }
            else {
                List<Gallery> gallery = galleryRepository.findCategory(Long.valueOf(cId));
                model.addAttribute("gallery", gallery);
            }
        }
        List<Category> category = categoryRepository.findAll();
        model.addAttribute("category" ,category);
        redirectAttributes.addFlashAttribute("sort", "true");

        return "gallery";
    }

    @PostMapping({"/addToCategory","/addToCategory/{id}"})
    public String addCategory(HttpServletRequest request, @ModelAttribute("categoryForm") Category categoryForm, RedirectAttributes redirectAttributes){
        Category c = new Category();
        String cName = request.getParameter("category");
        c.setName(cName);
        categoryRepository.save(c);
        redirectAttributes.addFlashAttribute("cate", "true");
        return "redirect:/adminPanel";
    }

    @GetMapping({"/photo", "/photo/{id}"})
    public String photo(@PathVariable long id, Model model) {
        Gallery g = galleryRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Empty gallery"));

        String desc = g.getOpis();
        String title = g.getTytul();
        String data = g.getDataDodania();
        Set<GalleryPhoto> photo = g.getGalleryPhoto();
        Long ide = g.getId();

        List<Opinion> opinion = opinionRepository.findOpinion(id);

        model.addAttribute("opinion",opinion);
        model.addAttribute("desc", desc);
        model.addAttribute("photo", photo);
        model.addAttribute("title", title);
        model.addAttribute("data", data);
        model.addAttribute("ide", ide);

        return "photo";
    }

    @PostMapping({"/writeOpinion", "/writeOpinion/{id}"})
    public String addFault(@PathVariable long id, HttpServletRequest request, @ModelAttribute("opinionForm") Opinion opinionForm, RedirectAttributes redirectAttributes) {

        Opinion o = new Opinion();

        String stars = request.getParameter("stars");
        String comment = request.getParameter("comment");
        String uname = request.getParameter("uname");

        User u = userRepository.findByUsername(uname);
        Gallery g = galleryRepository.findById(id).orElseThrow();

        o.setStars(stars);
        o.setComment(comment);
        o.setUser(u);
        o.setGallery(g);

        opinionRepository.save(o);

        redirectAttributes.addFlashAttribute("opinion", "true");
        return "redirect:/gallery";
    }

    @GetMapping({"/deleteGallery", "/deleteGallery/{id}"})
    public String deleteGallery(@PathVariable Optional<Long> id, RedirectAttributes redirectAttributes) {
        if (id.isPresent()) {
            Gallery g = galleryRepository.findById(id.get()).orElseThrow();
            galleryRepository.deleteById(id.get());
            redirectAttributes.addFlashAttribute("success", "true");
        }
        return "redirect:/adminPanel";
    }

    @GetMapping({"/adminPanel","/adminPanel/{id}"})
    public String adminPanel(Model model) {
        return "adminPanel";
    }

    @GetMapping({"/deleteUser", "/deleteUser/{id}"})
    public String deleteUser(@PathVariable Optional<Long> id, RedirectAttributes redirectAttributes) {
        if (id.isPresent()) {
            User u = userRepository.findById(id.get()).orElseThrow();
            userRepository.deleteById(id.get());
            redirectAttributes.addFlashAttribute("delUser", "true");
        }
        return "redirect:/adminPanel";
    }

    @GetMapping({"/deleteOpinion", "/deleteOpinion/{id}"})
    public String deleteOpinion(@PathVariable Optional<Long> id, RedirectAttributes redirectAttributes) {
        if (id.isPresent()) {
            Opinion o = opinionRepository.findById(id.get()).orElseThrow();
            opinionRepository.deleteById(id.get());
            redirectAttributes.addFlashAttribute("opinionD", "true");
        }
        return "redirect:/adminPanel";
    }
}
