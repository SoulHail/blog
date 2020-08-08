package com.example.blog.test.upload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NewhandQuery implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 页码
     */
    private String pageNum = "1";

    /**
     * 每页大小
     */
    private String pageSize = "10";

    /**
     * 标题
     */
    private String title;

    /**
     * 进行状态
     */
    private String status;

}
