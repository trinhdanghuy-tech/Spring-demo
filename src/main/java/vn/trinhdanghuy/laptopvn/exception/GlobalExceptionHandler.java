package vn.trinhdanghuy.laptopvn.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.http.ResponseEntity;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleException(Exception ex) {
        StringBuilder sb = new StringBuilder();
        sb.append("<h1>ERROR CAUGHT BY GLOBAL HANDLER</h1>");
        sb.append("<h3>Exception: ").append(ex.getClass().getName()).append("</h3>");
        sb.append("<p>Message: ").append(ex.getMessage()).append("</p>");
        sb.append("<pre>");
        for (StackTraceElement element : ex.getStackTrace()) {
            sb.append(element.toString()).append("\n");
        }
        sb.append("</pre>");
        return ResponseEntity.status(500).body(sb.toString());
    }
}
