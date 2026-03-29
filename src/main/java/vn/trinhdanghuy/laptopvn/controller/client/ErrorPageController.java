package vn.trinhdanghuy.laptopvn.controller.client;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Map;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorViewResolver;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class ErrorPageController implements ErrorViewResolver {

    @Override
    public ModelAndView resolveErrorView(HttpServletRequest request, HttpStatus status, Map<String, Object> model) {
        Object message = model.get("message");
        Object exception = request.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
        Object requestUri = request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);

        String errorMessage = (message != null && !message.toString().isBlank())
                ? message.toString()
                : "Da xay ra loi ngoai y muon.";

        if (exception != null && (message == null || message.toString().isBlank())) {
            errorMessage = exception.toString();
        }

        model.put("status", status.value());
        model.put("errorMessage", errorMessage);
        model.put("requestUri", requestUri != null ? requestUri.toString() : request.getRequestURI());

        return new ModelAndView("client/error/show", model);
    }
}
