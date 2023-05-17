package org.example.goSeoul.controller;

import org.example.goSeoul.model.WithBean;
import org.example.goSeoul.service.WithService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

@Controller
public class WithController {

    @Autowired
    private WithService withService;

    // 동행글 작성 폼
    @RequestMapping("withWrite.do")
    public String withWrite() {
        System.out.println("withWrite");
        return "with/withWrite";
    }

    // 동행글 작성
    @RequestMapping("withWriteResult.do")
    public String withWriteResult(@ModelAttribute WithBean wb,
                                  @RequestParam("with_filename1") MultipartFile mf,
                                  HttpServletRequest request,
                                  Model model) throws Exception {

        System.out.println("withWriteResult");
        System.out.println("mf:" + mf);
        System.out.println("tag:" + wb.getWith_tag());

//        int result = withService.insertCheck(wb);
//        model.addAttribute("result", result);

        // 파일 업로드 처리
        if (!mf.isEmpty()) {
            String uploadPath = request.getRealPath("upload"); // 업로드 디렉토리 경로를 설정합니다

            System.out.println("path: " + uploadPath);

            // UUID를 사용하여 고유한 파일명 생성
            String originalFilename = mf.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFilename = UUID.randomUUID().toString() + extension;

            // 파일을 업로드 디렉토리에 저장합니다
            String filePath = uploadPath + File.separator + newFilename;
            mf.transferTo(new File(filePath));

            wb.setWith_filename(newFilename);

            int result = withService.insertCheck(wb);
            model.addAttribute("result", result);
        }
        return "with/withWriteResult";
    }
}