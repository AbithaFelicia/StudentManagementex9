
package com.example.demo;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "student")
public class Student {
    @Id
    private Long regno;
    private String name;
    private double cgpa;
    public Student() {
    }
    public Student(Long regno, String name, double cgpa) {
        this.regno = regno;
        this.name = name;
        this.cgpa = cgpa;
    }
    public Long getRegno() {
        return regno;
    }

    public void setRegno(Long regno) {
        this.regno = regno;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getCgpa() {
        return cgpa;
    }

    public void setCgpa(double cgpa) {
        this.cgpa = cgpa;
    }
}
