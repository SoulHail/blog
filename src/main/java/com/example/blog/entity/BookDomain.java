package com.example.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookDomain {
    private String uuid;
    private String bookName;
    private BigDecimal price;
    private String introduction;
    private String url;
}
