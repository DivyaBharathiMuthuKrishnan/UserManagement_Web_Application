package com.divya.usermanagement.controller;

import com.xadmin.usermanagement.dao.USerDAO;
import com.xadmin.usermanagement.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    private USerDAO userDAO = new USerDAO();

    @GetMapping("/list")
    public String listUsers(Model model) {
        List<User> listUser = userDAO.selectAllUsers();
        model.addAttribute("listUser", listUser);
        return "user-list";
    }
@GetMapping("/")
    public String home() {
        return "redirect:/list";
    }

    @GetMapping("/new")
    public String showNewForm(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "user-form";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user) {
        if (user.getId() == 0) {
            try {
                userDAO.insertUser(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                userDAO.updateUser(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/list";
    }

    @GetMapping("/edit")
    public String showEditForm(@RequestParam("id") int id, Model model) {
        User existingUser = userDAO.selectUser(id);
        model.addAttribute("user", existingUser);
        return "user-form";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("id") int id) {
        try {
            userDAO.deleteUser(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/list";
    }
}
