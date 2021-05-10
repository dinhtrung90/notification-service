package com.vts.notification.service.dto;

import com.vts.notification.domain.AccountStatus;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.Instant;

@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EligibilityEmployeeMessage implements Serializable {

    private Long id;

    @NotNull
    private String employeeId;

    @NotNull
    private String sourceId;

    private String firstName;

    private String lastName;

    private String middleInitial;

    @NotNull
    private String emailAddress;

    @NotNull
    private String numberPhone;

    private String street;

    private String zip;

    private Instant birthDay;

    @NotNull
    private String department;

    private String socialSecurityNumber;

    @NotNull
    private AccountStatus accountStatus;

    private String signUpToken;

    private String signUpLink;

    private Instant expiredDate;

    private String temporaryPassword;

}
