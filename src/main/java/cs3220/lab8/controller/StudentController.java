package cs3220.lab8.controller;

import cs3220.lab8.DataStore;
import cs3220.lab8.model.Student;
import cs3220.lab8.model.SwimClass;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.NoSuchElementException;

@Controller
public class StudentController {
    private final DataStore dataStore;

    public StudentController (DataStore dataStore){
        this.dataStore = dataStore;
    }

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/success")
    public String success() {
        return "success";
    }

    @PostMapping("/register")
    public String register( @RequestParam String name, @RequestParam String birthYear, @RequestParam int level, @RequestParam int session, @RequestParam String time1, @RequestParam String time2) {
        dataStore.addEntry(name, birthYear, level, time1, time2, session);
        return "redirect:/success";
    }

    @GetMapping("/students")
    public String register(Model model, @RequestParam(defaultValue = "1") int session) {

        model.addAttribute("students", dataStore.getEntriesBySession(session));
        model.addAttribute("session", session);
        return "students";
    }

    @GetMapping("/classes")
    public String classes(Model model, @RequestParam(defaultValue = "1") int session) {
        model.addAttribute("classes", dataStore.getClassesBySession(session));
        model.addAttribute("session", session);
        return "classes";
    }

    @PostMapping("/classes")
    public String createClass(@RequestParam int session, @RequestParam int level, @RequestParam String time) {
        dataStore.addClass(session, level, time);
        return "redirect:/classes?session=" + session;
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable int id, @RequestParam int session) {
        dataStore.deleteEntry(id);
        return "redirect:/students?session=" + session;
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") int id, Model model) {
        try {
            Student student = dataStore.getEntry(id);
            model.addAttribute("student", student);
            return "edit";
        } catch (NoSuchElementException e) {
            return "redirect:/students";
        }

    }
    @PostMapping("/edit/{id}")
    public String edit(@PathVariable("id") int id, @RequestParam String name, @RequestParam String birthYear, @RequestParam int level, @RequestParam int session, @RequestParam String time1, @RequestParam String time2) {
        try {
            dataStore.updateEntry(id, name, birthYear, level, time1, time2, session);
            return "redirect:../students?session=" + session;
        } catch (NoSuchElementException e) {
            return "redirect:../students";
        }
    }

    @RequestMapping("/view/{id}")
    public String view(@PathVariable("id") int id, Model model) {
        try {
            Student student = dataStore.getEntry(id);
            ArrayList<SwimClass> assignableClasses = dataStore.getAssignableClasses(id);
            model.addAttribute("student", student);
            model.addAttribute("assignableClasses", assignableClasses);
            model.addAttribute("assignedClass", null);
            if (student.isAssigned()) {
                model.addAttribute("assignedClass", dataStore.getClassById(student.getAssignedClassId()));
            }
            return "view";
        } catch (NoSuchElementException e) {
            return "redirect:/students";
        }
    }

    @PostMapping("/assign/{id}")
    public String assign(@PathVariable("id") int id, @RequestParam int classId) {
        try {
            dataStore.assignStudentToClass(id, classId);
            return "redirect:/view/" + id;
        } catch (NoSuchElementException | IllegalArgumentException e) {
            return "redirect:/students";
        }
    }

}
