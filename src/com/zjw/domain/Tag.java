package com.zjw.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/***
 * 
 * @Description: ��ǩʵ����
 * 
 * @author zjw
 * 
 * @create time 2015-6-12 ����03:05:47
 */

@Entity
@Table(name = "t_tag")
public class Tag {

	private Integer id;
	private String name; // ��ǩ����
	private String url; // ��ǩ��ַ

	@Id
	@GeneratedValue(generator = "_native")
	@GenericGenerator(name = "_native", strategy = "native")
	public Integer getId() {
		return id;
	}

	@Column(length = 30)
	public String getName() {
		return name;
	}

	@Column(length = 100)
	public String getUrl() {
		return url;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}