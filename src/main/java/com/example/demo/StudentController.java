
package com.example.demo;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class StudentController {

    private final StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    // Display all students
    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "student-list";
    }

    // Display the form to add a student
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("pageTitle", "Add Student");
        return "student-form";
    }

    // Save a new student
    @PostMapping("/save")
    public String saveStudent(
            @ModelAttribute("student") Student student,
            RedirectAttributes redirectAttributes) {

        studentService.saveStudent(student);
        redirectAttributes.addFlashAttribute(
                "message", "Student saved successfully!");

        return "redirect:/";
    }

    // Search student by registration number
    @GetMapping("/search")
    public String searchStudent(
            @RequestParam(value = "regno", required = false) Long regno,
            Model model) {

        if (regno == null) {
            model.addAttribute("students", studentService.getAllStudents());
            model.addAttribute("searchMessage", "Enter a registration number.");
            return "student-list";
        }

        Optional<Student> result = studentService.getStudentById(regno);

        if (result.isPresent()) {
            model.addAttribute("students", List.of(result.get()));
        } else {
            model.addAttribute("students", List.of());
            model.addAttribute("searchMessage", "No student found.");
        }

        return "student-list";
    }

    // Display the form to update a student
    @GetMapping("/edit/{regno}")
    public String showEditForm(
            @PathVariable Long regno,
            Model model,
            RedirectAttributes redirectAttributes) {

        Optional<Student> result = studentService.getStudentById(regno);

        if (result.isEmpty()) {
            redirectAttributes.addFlashAttribute(
                    "message", "Student not found!");
            return "redirect:/";
        }

        model.addAttribute("student", result.get());
        model.addAttribute("pageTitle", "Update Student");
        return "student-form";
    }

    // Delete a student
    @GetMapping("/delete/{regno}")
    public String deleteStudent(
            @PathVariable Long regno,
            RedirectAttributes redirectAttributes) {

        if (studentService.getStudentById(regno).isPresent()) {
            studentService.deleteStudent(regno);
            redirectAttributes.addFlashAttribute(
                    "message", "Student deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute(
                    "message", "Student not found!");
        }

        return "redirect:/";
    }
}
