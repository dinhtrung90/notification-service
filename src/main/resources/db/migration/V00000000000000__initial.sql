

-- Table structure for jhi_persistent_audit_event
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
CREATE TABLE `jhi_persistent_audit_event` (
                                              `event_id` bigint NOT NULL AUTO_INCREMENT,
                                              `principal` varchar(50) NOT NULL,
                                              `event_date` timestamp NULL DEFAULT NULL,
                                              `event_type` varchar(255) DEFAULT NULL,
                                              PRIMARY KEY (`event_id`),
                                              KEY `idx_persistent_audit_event` (`principal`,`event_date`)
);


-- ----------------------------
-- Table structure for jhi_user
-- ----------------------------
DROP TABLE IF EXISTS `tvs_user`;
CREATE TABLE `tvs_user` (
                            `id` varchar(100) NOT NULL,
                            `login` varchar(50) NOT NULL,
                            `first_name` varchar(50) DEFAULT NULL,
                            `last_name` varchar(50) DEFAULT NULL,
                            `email` varchar(191) DEFAULT NULL,
                            `image_url` varchar(256) DEFAULT NULL,
                            `activated` bit(1) NOT NULL,
                            `lang_key` varchar(10) DEFAULT NULL,
                            `created_by` varchar(50) NOT NULL,
                            `created_date` timestamp NULL DEFAULT NULL,
                            `last_modified_by` varchar(50) DEFAULT NULL,
                            `last_modified_date` timestamp NULL DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `ux_user_login` (`login`),
                            UNIQUE KEY `ux_user_email` (`email`)
);
