package com.example.blog.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.Objects;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class ResultVo<T> {

    /**
     * 默认成功code
     */
    public static final String DEFAULT_SUCCESS_CODE = "0";

    /**
     * 默认成功message
     */
    public static final String DEFAULT_SUCCESS_MESSAGE = "SUCCESS";

    /**
     * 默认失败code
     */
    public static final String DEFAULT_FAILED_CODE = "9999";

    /**
     * 默认失败message
     */
    public static final String DEFAULT_FAILED_MESSAGE = "FAILED";

    @Builder.Default
    private String code = DEFAULT_SUCCESS_CODE;

    @Builder.Default
    private String message = DEFAULT_SUCCESS_MESSAGE;

    private T data;

    /**
     * 自定义code message成功方法
     *
     * @param code
     * @param message
     * @param data
     * @param <T>
     * @return
     */
    public static <T> ResultVo success(String code, String message, T data) {
        Objects.requireNonNull(code);
        Objects.requireNonNull(message);
        return ResultVo.<T>builder().code(code).message(message).data(data).build();
    }

    /**
     * 自定义code message失败方法
     *
     * @param code
     * @param message
     * @return
     */
    public static ResultVo failed(String code, String message) {
        return ResultVo.builder().code(code).message(message).build();
    }
}
