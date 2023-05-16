package org.example.goSeoul.model;


import lombok.Data;

@Data
public class WithBean {

    private int with_no;
    private String with_title;
    private String with_content;
    private int with_maxto;
    private String with_tag;
    private int with_hit;
    private String with_category;
    private int with_age;
    private String with_start;
    private String with_end;
    private String with_date; /* 작성시간 */
    private String with_filename; /* 파일이름 */
    private String with_filepath; /* 파일경로 */

}