package com.zjw.domain;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/***
 * 
 * @Description: ����ʵ����
 * 
 * @author zjw
 * 
 * @create time 2015-6-12 ����02:22:14
 */

@Entity
@Table(name = "t_notice")
public class Notice {

	private String content; // ��������
	private Date createTime; // ���洴��ʱ��
	private Integer id;
	private String title; // �������

	@Lob
	@Column(columnDefinition = "text")
	@Basic(fetch = FetchType.LAZY)
	public String getContent() {
		return content;
	}

	@Column
	public Date getCreateTime() {
		return createTime;
	}

	@Id
	@GeneratedValue(generator = "_native")
	@GenericGenerator(strategy = "native", name = "_native")
	public Integer getId() {
		return id;
	}

	@Column(length = 50)
	public String getTitle() {
		return title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}