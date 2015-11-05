package com.liveman.shop.entity;

import java.util.List;

public class Teacher {
	private int id;
	private String name;
	private String gender;
	private String researchArea;
	private String title;
	
	private List<Student> supStudents;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getResearchArea() {
		return researchArea;
	}

	public void setResearchArea(String researchArea) {
		this.researchArea = researchArea;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Student> getSupStudents() {
		return supStudents;
	}

	public void setSupStudents(List<Student> supStudents) {
		this.supStudents = supStudents;
	}

}
