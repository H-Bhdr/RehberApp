package com.JavaProje.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.nio.file.AccessDeniedException;
import java.util.*;

@RestControllerAdvice
public class GlobalExceptionHandler {

    private <T> ApiError<T> createApiError(T errors) {
        ApiError<T> apiError = new ApiError<>();
        apiError.setId(UUID.randomUUID().toString());
        apiError.setErrorTime(new Date());
        apiError.setErrors(errors);
        return apiError;
    }

    // 400 - Validation Errors
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public ResponseEntity<ApiError<Map<String, List<String>>>> handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
        Map<String, List<String>> errorsMap = new HashMap<>();
        for (ObjectError objError : ex.getBindingResult().getAllErrors()) {
            String fieldName = ((FieldError) objError).getField();
            errorsMap.putIfAbsent(fieldName, new ArrayList<>());
            errorsMap.get(fieldName).add(objError.getDefaultMessage());
        }
        ApiError<Map<String, List<String>>> apiError = createApiError(errorsMap);
        return ResponseEntity.badRequest().body(apiError);
    }

    // 404 - Not Found
    @ExceptionHandler(value = NoHandlerFoundException.class)
    public ResponseEntity<ApiError<String>> handleNotFound(NoHandlerFoundException ex) {
        ApiError<String> apiError = createApiError("The requested resource was not found.");
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(apiError);
    }

    // 403 - Access Denied
    @ExceptionHandler(value = AccessDeniedException.class)
    public ResponseEntity<ApiError<String>> handleAccessDenied(AccessDeniedException ex) {
        ApiError<String> apiError = createApiError("You do not have permission to access this resource.");
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(apiError);
    }

    // 500 - Internal Server Error
    @ExceptionHandler(value = Exception.class)
    public ResponseEntity<ApiError<String>> handleGenericException(Exception ex) {
        ApiError<String> apiError = createApiError("An unexpected error occurred: " + ex.getMessage());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(apiError);
    }
}
