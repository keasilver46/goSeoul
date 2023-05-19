package org.example.goSeoul.model;

import java.sql.Timestamp;

public class Board {

	private int free_no;
	private String local_no;
	private String free_title;
	private String user_no;
	private String free_content;
	private String free_category;
	private String free_tag;
	private int free_hit;
	private int free_like;
	private int free_dislike;
	private Timestamp free_date;
	private String free_filename;
	private String free_filepath;

	
	
	// page
	private int startRow;
	private int endRow;
	// 검색
	private String search;
	private String keyword;

	// etc.
	private int ref;
	private int re_step;
	private int re_level;
	private String ip;
	
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public String getLocal_no() {
		return local_no;
	}
	public void setLocal_no(String local_no) {
		this.local_no = local_no;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public String getFree_category() {
		return free_category;
	}
	public void setFree_category(String free_category) {
		this.free_category = free_category;
	}
	public String getFree_tag() {
		return free_tag;
	}
	public void setFree_tag(String free_tag) {
		this.free_tag = free_tag;
	}
	public int getFree_hit() {
		return free_hit;
	}
	public void setFree_hit(int free_hit) {
		this.free_hit = free_hit;
	}
	public int getFree_like() {
		return free_like;
	}
	public void setFree_like(int free_like) {
		this.free_like = free_like;
	}
	public int getFree_dislike() {
		return free_dislike;
	}
	public void setFree_dislike(int free_dislike) {
		this.free_dislike = free_dislike;
	}
	public Timestamp getFree_date() {
		return free_date;
	}
	public void setFree_date(Timestamp free_date) {
		this.free_date = free_date;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFree_filename() {
		return free_filename;
	}
	public void setFree_filename(String free_filename) {
		this.free_filename = free_filename;
	}
	public String getFree_filepath() {
		return free_filepath;
	}
	public void setFree_filepath(String free_filepath) {
		this.free_filepath = free_filepath;
	}
	
	
}
