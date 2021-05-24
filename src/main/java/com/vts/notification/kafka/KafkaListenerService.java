package com.vts.notification.kafka;

import com.vts.notification.service.MailService;
import com.vts.notification.service.dto.UserDTO;
import com.vts.notification.service.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Valid;

@Component
@Transactional
public class KafkaListenerService {

    private final Logger log = LoggerFactory.getLogger(KafkaListenerService.class);

    @Autowired
    private MailService emailService;

    @Autowired
    private UserMapper userMapper;

    @KafkaListener(
        topics = "${app.kafka.topic.invitation}",
        groupId = "${app.kafka.group.consumers}",
        containerFactory = "appKafkaListenerContainerFactory")
    void processCreatedAccount(UserDTO message) {
        log.debug("process created account: {}", message);
        emailService.sendCreationEmail(userMapper.userDTOToUser(message));
    }

}
