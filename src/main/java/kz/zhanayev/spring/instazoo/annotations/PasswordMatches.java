package kz.zhanayev.spring.instazoo.annotations;


import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import kz.zhanayev.spring.instazoo.validations.PasswordMatchesValidator;

import java.lang.annotation.*;

@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = PasswordMatchesValidator.class)
@Documented
public @interface PasswordMatches {

    String message() default "Password do not match";

    Class<?>[] groups() default{};

    Class<? extends Payload>[] payload() default {};
}
