package com.example.case_study.model.employee;

public class EducationDegree {
    private int education_degree;
    private String education_degree_name;

    public EducationDegree(int education_degree, String education_degree_name) {
        this.education_degree = education_degree;
        this.education_degree_name = education_degree_name;
    }

    public EducationDegree(String education_degree_name) {
        this.education_degree_name = education_degree_name;
    }

    public EducationDegree() {
    }

    public int getEducation_degree() {
        return education_degree;
    }

    public void setEducation_degree(int education_degree) {
        this.education_degree = education_degree;
    }

    public String getEducation_degree_name() {
        return education_degree_name;
    }

    public void setEducation_degree_name(String education_degree_name) {
        this.education_degree_name = education_degree_name;
    }
}
