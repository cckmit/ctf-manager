package com.ctf.component.commons.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import javax.validation.ReportAsSingleViolation;
import javax.validation.constraints.Pattern;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * 手机号码验证器
 *
 *
 */
@Documented
@Constraint(validatedBy = {})
@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
@Retention(RUNTIME)
@ReportAsSingleViolation
@Pattern(regexp = "^1\\d{10}$")
public @interface TelephoneNumber {

	String message() default "{com.ctf.component.commons.validator.TelephoneNumber.message}";

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};

}
