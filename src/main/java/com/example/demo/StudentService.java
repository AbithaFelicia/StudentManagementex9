
package com.example.demo;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class StudentService {

    private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    // Add a new student or update an existing student
    public Student saveStudent(Student student) {
        return studentRepository.save(student);
    }

    // Display all students
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    // Search for a student using registration number
    public Optional<Student> getStudentById(Long regno) {
        return studentRepository.findById(regno);
    }

    // Delete a student using registration number
    public void deleteStudent(Long regno) {
        studentRepository.deleteById(regno);
    }
}
