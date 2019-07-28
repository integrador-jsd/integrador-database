USE integrador;

SET FOREIGN_KEY_CHECKS=0 
;

/* Drop Tables */

DROP TABLE IF EXISTS `Block` CASCADE
;

DROP TABLE IF EXISTS `Classroom_type` CASCADE
;

DROP TABLE IF EXISTS `Event` CASCADE
;

DROP TABLE IF EXISTS `Event_record` CASCADE
;

DROP TABLE IF EXISTS `Event_state` CASCADE
;

DROP TABLE IF EXISTS `Event_type` CASCADE
;

DROP TABLE IF EXISTS `Item` CASCADE
;

DROP TABLE IF EXISTS `Items_per_request` CASCADE
;

DROP TABLE IF EXISTS `Items_per_room` CASCADE
;

DROP TABLE IF EXISTS `Request` CASCADE
;

DROP TABLE IF EXISTS `Request_record` CASCADE
;

DROP TABLE IF EXISTS `Request_state` CASCADE
;

DROP TABLE IF EXISTS `Request_type` CASCADE
;

DROP TABLE IF EXISTS `Room` CASCADE
;

DROP TABLE IF EXISTS `Rooms_per_Logistic_Unit` CASCADE
;

DROP TABLE IF EXISTS `Rooms_per_section` CASCADE
;

DROP TABLE IF EXISTS `Rooms_per_turn` CASCADE
;

DROP TABLE IF EXISTS `Section` CASCADE
;

DROP TABLE IF EXISTS `Sectional` CASCADE
;

DROP TABLE IF EXISTS `Turn` CASCADE
;

DROP TABLE IF EXISTS `Turn_record` CASCADE
;

DROP TABLE IF EXISTS `User` CASCADE
;

DROP TABLE IF EXISTS `User_record` CASCADE
;

DROP TABLE IF EXISTS `User_type` CASCADE
;

/* Create Tables */

CREATE TABLE `Block`
(
	`number` INT NOT NULL,
	`sectional_id` INT NOT NULL,
	CONSTRAINT `PK_Bloque` PRIMARY KEY (`number` ASC, `sectional_id` ASC)
)
COMMENT = 'Espacio físico conformado por aulas.'

;

CREATE TABLE `Classroom_type`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(50) NOT NULL,
	`description` VARCHAR(50) NULL,
	CONSTRAINT `PK_tipo_aulas` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Tipo de aulas donde se desarrollan actividades académicas  	- Aula 	- Laboratorio 	- Auditorio 	- Taller'

;

CREATE TABLE `Event`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NULL,
	`start_time` TIMESTAMP NULL,
	`end_time` TIMESTAMP NULL,
	`event_type` INT NULL,
	`sectional_id` INT NULL,
	`block_id` INT NULL,
	`room_id` INT NULL,
	`state_id` INT NULL,
	`description` VARCHAR(50) NULL,
	`user_id` VARCHAR(50) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Espacio de tiempo dedicado al desarrollo de actividades académicas de un grupo, que se realizan en un aula.'

;

CREATE TABLE `Event_record`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`event_id` INT NULL,
	`updated_at` TIMESTAMP NULL,
	`comment` VARCHAR(50) NULL,
	`updated_by` VARCHAR(50) NULL,
	`state_id` INT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Event_state`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NULL,
	CONSTRAINT `PK_estado_evento` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Event_type`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(50) NULL,
	CONSTRAINT `PK_tipo_evento` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Los eventos pueden ser de diferentes tipos  	- Clases normales, agendadas de acuerdo a las demandas de los cursos. 	- Reservas de otro tipo, supongo.'

;

CREATE TABLE `Item`
(
	`id` INT NOT NULL,
	`name` VARCHAR(50) NULL,
	CONSTRAINT `PK_item` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Elemento físico supervisado por una unidad logística que se puede disponer en las aulas o ser prestado particularmente.'

;

CREATE TABLE `Items_per_request`
(
	`request_id` INT NOT NULL,
	`item_id` INT NOT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`request_id` ASC, `item_id` ASC)
)

;

CREATE TABLE `Items_per_room`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`item_id` INT NOT NULL,
	`sectional_id` INT NOT NULL,
	`block_id` INT NOT NULL,
	`room_id` INT NOT NULL,
	CONSTRAINT `PK_Items_per_room` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Request`
(
	`id` INT NOT NULL,
	`request_type` INT NULL,
	`descripton` VARCHAR(50) NULL,
	`state_id` INT NULL,
	`created_by` VARCHAR(50) NULL,
	`created_at` TIMESTAMP NULL,
	`sectional_id` INT NULL,
	`block_id` INT NULL,
	`room_id` INT NULL,
	`event_id` INT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Request_record`
(
	`id` INT NOT NULL,
	`requst_id` INT NULL,
	`updated_at` TIMESTAMP NULL,
	`observation` VARCHAR(50) NULL,
	`uptated_by` VARCHAR(50) NULL,
	`state_id` VARCHAR(50) NULL,
	CONSTRAINT `PK_historial_solicitud` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Request_state`
(
	`id` INT NOT NULL,
	`state` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_estado_solicitud` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Request_type`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(50) NULL,
	CONSTRAINT `PK_tipo_solicitud` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Room`
(
	`id` INT NOT NULL,
	`block_id` INT NOT NULL,
	`sectional_id` INT NOT NULL,
	`capacity` INT NULL,
	`type` INT NULL,
	CONSTRAINT `PK_Aula` PRIMARY KEY (`id` ASC, `sectional_id` ASC, `block_id` ASC)
)
COMMENT = 'Espacio en el que se desarrolla un evento, como una clase magistral, reuniones de un semillero de investigación, entre otras.'

;

CREATE TABLE `Rooms_per_Logistic_Unit`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`logistic_unit` VARCHAR(50) NOT NULL,
	`sectional_id` INT NOT NULL,
	`block_id` INT NOT NULL,
	`room_id` INT NOT NULL
)

;

CREATE TABLE `Rooms_per_section`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`section_id` INT NULL,
	`room_id` INT NULL,
	`block_id` INT NULL,
	`sectional_id` INT NULL,
	CONSTRAINT `PK_Rooms_per_section` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Rooms_per_turn`
(
	`turn_id` INT NOT NULL,
	`sectional_id` INT NOT NULL,
	`block_id` INT NOT NULL,
	`room_id` INT NOT NULL,
	CONSTRAINT `PK_aulas_por_turno` PRIMARY KEY (`turn_id` ASC, `sectional_id` ASC, `block_id` ASC, `room_id` ASC)
)

;

CREATE TABLE `Section`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`logistic_unit` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Sectional`
(
	`id` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`address` VARCHAR(50) NULL,
	`phone_number` VARCHAR(50) NULL,
	CONSTRAINT `PK_Seccional` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Turn`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`start_hour` TIMESTAMP NULL,
	`end_hour` TIMESTAMP NULL,
	`state_id` INT NULL,
	`auxiliar_id` VARCHAR(50) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Intervalo de tiempo en el que un auxiliar realiza las tareas que le corresponden, como el monitoreo y apoyo logístico a la sector que le fue asignada, responder a las solicitudes que se generen durante su turno'

;

CREATE TABLE `Turn_record`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`updated_at` TIMESTAMP NULL,
	`updated_by` TIMESTAMP NULL,
	`comment` VARCHAR(50) NULL,
	`turn_id` INT NULL,
	CONSTRAINT `PK_Turn_record` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `User`
(
	`username` VARCHAR(50) NOT NULL COMMENT 'Nombre de usuario del portal institucional.',
	`email` VARCHAR(50) NULL COMMENT 'Correo institucional.',
	`logistic_unit` VARCHAR(50) NULL COMMENT 'Unidad logística a la que está asociado el usuario. NULL indica que no está asociado a ninguna.',
	`user_type` INT NULL,
	CONSTRAINT `PK_usuario` PRIMARY KEY (`username` ASC)
)
COMMENT = 'Usuario del sistema de información que puede ser de varios tipos  	- Auxiliar 	- Unidad logística 	- Usuario normal'

;

CREATE TABLE `User_record`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NULL,
	`observation` VARCHAR(50) NULL,
	`updated_at` TIMESTAMP NULL,
	`updated_by` VARCHAR(50) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Registro de los distintos estados por los que pasa un usuario.'

;

CREATE TABLE `User_type`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_tipo_usuario` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Almacena los distintos  tipos de usuario soportados por el sistema:  	- Auxiliar: Persona encargada de supervisar y brindar soporte logístico a las aulas de una sección. Por soporte logístico se entiende realizar préstamos de aulas, abrirlas, cerrarlas o atender las solicitudes que se puedan generar. 	- Unidad logística: Entidad encargada de la gestión de los auxiliares y sus tareas, horarios y turnos, de las aulas y de los implementos que tiene bajo su potestad. 	- Usuario: Persona que usa la aplicación con el fin de realizar algún préstamo o solicitar ayuda. ( Persona que requiere un servicio de préstamo o ayuda brindado por la unidad logística.)'

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `Block` 
ADD INDEX `IXFK_Bloque_Seccional` (`sectional_id` ASC)
;

ALTER TABLE `Event` 
ADD INDEX `IXFK_evento_Aula` (`room_id` ASC, `sectional_id` ASC, `block_id` ASC)
;

ALTER TABLE `Event` 
ADD INDEX `IXFK_evento_estado_evento` (`state_id` ASC)
;

ALTER TABLE `Event` 
ADD INDEX `IXFK_evento_tipo_evento` (`event_type` ASC)
;

ALTER TABLE `Event` 
ADD INDEX `IXFK_evento_usuario` (`user_id` ASC)
;

ALTER TABLE `Event_record` 
ADD INDEX `IXFK_historial_evento_estado_evento` (`state_id` ASC)
;

ALTER TABLE `Event_record` 
ADD INDEX `IXFK_historial_evento_evento` (`event_id` ASC)
;

ALTER TABLE `Items_per_request` 
ADD INDEX `IXFK_items_por_solicitud_item` (`item_id` ASC)
;

ALTER TABLE `Items_per_request` 
ADD INDEX `IXFK_items_por_solicitud_Solicitud` (`request_id` ASC)
;

ALTER TABLE `Items_per_room` 
ADD INDEX `IXFK_Items_per_room_Item` (`item_id` ASC)
;

ALTER TABLE `Items_per_room` 
ADD INDEX `IXFK_Items_per_room_Room` (`room_id` ASC, `sectional_id` ASC, `block_id` ASC)
;

ALTER TABLE `Request` 
ADD INDEX `IXFK_Solicitud_Aula` (`room_id` ASC, `sectional_id` ASC, `block_id` ASC)
;

ALTER TABLE `Request` 
ADD INDEX `IXFK_Solicitud_estado_solicitud` (`state_id` ASC)
;

ALTER TABLE `Request` 
ADD INDEX `IXFK_Solicitud_evento` (`event_id` ASC)
;

ALTER TABLE `Request` 
ADD INDEX `IXFK_Solicitud_tipo_solicitud` (`request_type` ASC)
;

ALTER TABLE `Request` 
ADD INDEX `IXFK_Solicitud_usuario` (`created_by` ASC)
;

ALTER TABLE `Request_record` 
ADD INDEX `IXFK_historial_solicitud_Solicitud` (`requst_id` ASC)
;

ALTER TABLE `Request_record` 
ADD INDEX `IXFK_historial_solicitud_usuario` (`uptated_by` ASC)
;

ALTER TABLE `Room` 
ADD INDEX `IXFK_Aula_Bloque` (`block_id` ASC, `sectional_id` ASC)
;

ALTER TABLE `Room` 
ADD INDEX `IXFK_Aula_tipo_aulas` (`type` ASC)
;

ALTER TABLE `Rooms_per_Logistic_Unit` 
ADD INDEX `IXFK_Rooms_per_Logisctic_Unit_Room` (`room_id` ASC, `sectional_id` ASC, `block_id` ASC)
;

ALTER TABLE `Rooms_per_Logistic_Unit` 
ADD INDEX `IXFK_Rooms_per_Logisctic_Unit_User` (`logistic_unit` ASC)
;

ALTER TABLE `Rooms_per_section` 
ADD INDEX `IXFK_Rooms_per_section_Room` (`room_id` ASC, `sectional_id` ASC, `block_id` ASC)
;

ALTER TABLE `Rooms_per_section` 
ADD INDEX `IXFK_Rooms_per_section_Section` (`section_id` ASC)
;

ALTER TABLE `Rooms_per_turn` 
ADD INDEX `IXFK_aulas_por_turno_Aula` (`room_id` ASC, `sectional_id` ASC, `block_id` ASC)
;

ALTER TABLE `Rooms_per_turn` 
ADD INDEX `IXFK_aulas_por_turno_turno` (`turn_id` ASC)
;

ALTER TABLE `Section` 
ADD INDEX `IXFK_Section_User` (`logistic_unit` ASC)
;

ALTER TABLE `Turn` 
ADD INDEX `IXFK_turno_usuario` (`auxiliar_id` ASC)
;

ALTER TABLE `Turn_record` 
ADD INDEX `IXFK_Turn_record_Turn` (`turn_id` ASC)
;

ALTER TABLE `User_record` 
ADD INDEX `IXFK_historial_usuario_usuario` (`username` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `Block` 
ADD CONSTRAINT `FK_Block_Sectional`
FOREIGN KEY (`sectional_id`) REFERENCES `Sectional` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event` 
ADD CONSTRAINT `FK_evento_Aula`
FOREIGN KEY (`room_id`, `sectional_id`, `block_id`) REFERENCES `Room` (`id`,`sectional_id`,`block_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event` 
ADD CONSTRAINT `FK_evento_estado_evento`
FOREIGN KEY (`state_id`) REFERENCES `Event_state` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event` 
ADD CONSTRAINT `FK_evento_tipo_evento`
FOREIGN KEY (`event_type`) REFERENCES `Event_type` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event` 
ADD CONSTRAINT `FK_evento_usuario`
FOREIGN KEY (`user_id`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event_record` 
ADD CONSTRAINT `FK_historial_evento_estado_evento`
FOREIGN KEY (`state_id`) REFERENCES `Event_state` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Items_per_request` 
ADD CONSTRAINT `FK_items_por_solicitud_Solicitud`
FOREIGN KEY (`request_id`) REFERENCES `Request` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Items_per_room` 
ADD CONSTRAINT `FK_Items_per_room_Item`
FOREIGN KEY (`item_id`) REFERENCES `Item` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Items_per_room` 
ADD CONSTRAINT `FK_Items_per_room_Room`
FOREIGN KEY (`room_id`, `sectional_id`, `block_id`) REFERENCES `Room` (`id`,`sectional_id`,`block_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
ADD CONSTRAINT `FK_Solicitud_Aula`
FOREIGN KEY (`room_id`, `sectional_id`, `block_id`) REFERENCES `Room` (`id`,`sectional_id`,`block_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
ADD CONSTRAINT `FK_Solicitud_estado_solicitud`
FOREIGN KEY (`state_id`) REFERENCES `Request_state` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
ADD CONSTRAINT `FK_Solicitud_evento`
FOREIGN KEY (`event_id`) REFERENCES `Event` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
ADD CONSTRAINT `FK_Solicitud_tipo_solicitud`
FOREIGN KEY (`request_type`) REFERENCES `Request_type` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
ADD CONSTRAINT `FK_Solicitud_usuario`
FOREIGN KEY (`created_by`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request_record` 
ADD CONSTRAINT `FK_historial_solicitud_Solicitud`
FOREIGN KEY (`requst_id`) REFERENCES `Request` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request_record` 
ADD CONSTRAINT `FK_historial_solicitud_usuario`
FOREIGN KEY (`uptated_by`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Room` 
ADD CONSTRAINT `FK_Aula_Bloque`
FOREIGN KEY (`block_id`, `sectional_id`) REFERENCES `Block` (`number`,`sectional_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Room` 
ADD CONSTRAINT `FK_Aula_tipo_aulas`
FOREIGN KEY (`type`) REFERENCES `Classroom_type` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_Logistic_Unit` 
ADD CONSTRAINT `FK_Rooms_per_Logisctic_Unit_Room`
FOREIGN KEY (`room_id`, `sectional_id`, `block_id`) REFERENCES `Room` (`id`,`sectional_id`,`block_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_section` 
ADD CONSTRAINT `FK_Rooms_per_section_Room`
FOREIGN KEY (`room_id`, `sectional_id`, `block_id`) REFERENCES `Room` (`id`,`sectional_id`,`block_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_section` 
ADD CONSTRAINT `FK_Rooms_per_section_Section`
FOREIGN KEY (`section_id`) REFERENCES `Section` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_turn` 
ADD CONSTRAINT `FK_aulas_por_turno_Aula`
FOREIGN KEY (`room_id`, `sectional_id`, `block_id`) REFERENCES `Room` (`id`,`sectional_id`,`block_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_turn` 
ADD CONSTRAINT `FK_aulas_por_turno_turno`
FOREIGN KEY (`turn_id`) REFERENCES `Turn` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Section` 
ADD CONSTRAINT `FK_Section_User`
FOREIGN KEY (`logistic_unit`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Turn` 
ADD CONSTRAINT `FK_turno_usuario`
FOREIGN KEY (`auxiliar_id`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Turn_record` 
ADD CONSTRAINT `FK_Turn_record_Turn`
FOREIGN KEY (`turn_id`) REFERENCES `Turn` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1 
;
