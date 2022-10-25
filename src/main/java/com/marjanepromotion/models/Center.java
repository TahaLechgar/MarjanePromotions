package com.marjanepromotion.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "center")
public class Center {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @NotNull
    @Column(name = "city", nullable = false, length = Integer.MAX_VALUE)
    private String city;

    @OneToMany(mappedBy = "center")
    private Set<DepartmentManager> departmentManagers = new LinkedHashSet<>();

    @OneToOne(mappedBy = "center")
    private Admin admins;

    public Admin getAdmins() {
        return admins;
    }

    public void setAdmins(Admin admins) {
        this.admins = admins;
    }

    public Set<DepartmentManager> getDepartmentManagers() {
        return departmentManagers;
    }

    public void setDepartmentManagers(Set<DepartmentManager> departmentManagers) {
        this.departmentManagers = departmentManagers;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

}