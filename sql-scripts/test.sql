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
	`sectionalID` INT NOT NULL,
	CONSTRAINT `PK_Bloque` PRIMARY KEY (`number` ASC, `sectionalID` ASC)
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
	`startTime` TIMESTAMP NULL,
	`endTime` TIMESTAMP NULL,
	`eventType` INT NULL,
	`sectionalID` INT NULL,
	`blockID` INT NULL,
	`roomID` INT NULL,
	`stateID` INT NULL,
	`description` VARCHAR(50) NULL,
	`userID` VARCHAR(50) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Espacio de tiempo dedicado al desarrollo de actividades académicas de un grupo, que se realizan en un aula.'

;

CREATE TABLE `Event_record`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`eventID` INT NULL,
	`updatedAt` TIMESTAMP NULL,
	`comment` VARCHAR(50) NULL,
	`updatedBy` VARCHAR(50) NULL,
	`stateID` INT NULL,
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
	`requestID` INT NOT NULL,
	`itemID` INT NOT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`requestID` ASC, `itemID` ASC)
)

;

CREATE TABLE `Items_per_room`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`itemID` INT NOT NULL,
	`sectionalID` INT NOT NULL,
	`blockID` INT NOT NULL,
	`roomID` INT NOT NULL,
	CONSTRAINT `PK_Items_per_room` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Request`
(
	`id` INT NOT NULL,
	`requestType` INT NULL,
	`descripton` VARCHAR(50) NULL,
	`stateID` INT NULL,
	`createdBy` VARCHAR(50) NULL,
	`createdAt` TIMESTAMP NULL,
	`sectionalID` INT NULL,
	`blockID` INT NULL,
	`roomID` INT NULL,
	`eventID` INT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Request_record`
(
	`id` INT NOT NULL,
	`requestID` INT NULL,
	`updatedAt` TIMESTAMP NULL,
	`observation` VARCHAR(50) NULL,
	`uptatedBy` VARCHAR(50) NULL,
	`stateID` VARCHAR(50) NULL,
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
	`blockID` INT NOT NULL,
	`sectionalID` INT NOT NULL,
	`capacity` INT NULL,
	`type` INT NULL,
	CONSTRAINT `PK_Aula` PRIMARY KEY (`id` ASC, `sectionalID` ASC, `blockID` ASC)
)
COMMENT = 'Espacio en el que se desarrolla un evento, como una clase magistral, reuniones de un semillero de investigación, entre otras.'

;

CREATE TABLE `Rooms_per_Logistic_Unit`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`logisticUnit` VARCHAR(50) NOT NULL,
	`sectionalID` INT NOT NULL,
	`blockID` INT NOT NULL,
	`roomID` INT NOT NULL
)

;

CREATE TABLE `Rooms_per_section`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`sectionID` INT NULL,
	`roomID` INT NULL,
	`blockID` INT NULL,
	`sectionalID` INT NULL,
	CONSTRAINT `PK_Rooms_per_section` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Rooms_per_turn`
(
	`turnID` INT NOT NULL,
	`sectionalID` INT NOT NULL,
	`blockID` INT NOT NULL,
	`roomID` INT NOT NULL,
	CONSTRAINT `PK_aulas_por_turno` PRIMARY KEY (`turnID` ASC, `sectionalID` ASC, `blockID` ASC, `roomID` ASC)
)

;

CREATE TABLE `Section`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`logisticUnit` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Sectional`
(
	`id` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`address` VARCHAR(50) NULL,
	`phoneNumber` VARCHAR(50) NULL,
	CONSTRAINT `PK_Seccional` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Turn`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`startTime` TIMESTAMP NULL,
	`endTime` TIMESTAMP NULL,
	`stateTime` INT NULL,
	`auxiliarID` VARCHAR(50) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)
COMMENT = 'Intervalo de tiempo en el que un auxiliar realiza las tareas que le corresponden, como el monitoreo y apoyo logístico a la sector que le fue asignada, responder a las solicitudes que se generen durante su turno'

;

CREATE TABLE `Turn_record`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`updatedAt` TIMESTAMP NULL,
	`updatedBy` TIMESTAMP NULL,
	`comment` VARCHAR(50) NULL,
	`turnID` INT NULL,
	CONSTRAINT `PK_Turn_record` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `User`
(
	`username` VARCHAR(50) NOT NULL COMMENT 'Nombre de usuario del portal institucional.',
	`email` VARCHAR(50) NULL COMMENT 'Correo institucional.',
	`logisticUnit` VARCHAR(50) NULL COMMENT 'Unidad logística a la que está asociado el usuario. NULL indica que no está asociado a ninguna.',
	`userType` INT NULL,
	CONSTRAINT `PK_usuario` PRIMARY KEY (`username` ASC)
)
COMMENT = 'Usuario del sistema de información que puede ser de varios tipos  	- Auxiliar 	- Unidad logística 	- Usuario normal'

;

CREATE TABLE `User_record`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NULL,
	`observation` VARCHAR(50) NULL,
	`updatedAt` TIMESTAMP NULL,
	`updatedBy` VARCHAR(50) NULL,
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
 ADD INDEX `IXFK_Bloque_Seccional` (`sectionalID` ASC)
;

ALTER TABLE `Event` 
 ADD INDEX `IXFK_evento_Aula` (`roomID` ASC, `sectionalID` ASC, `blockID` ASC)
;

ALTER TABLE `Event` 
 ADD INDEX `IXFK_evento_estado_evento` (`stateID` ASC)
;

ALTER TABLE `Event` 
 ADD INDEX `IXFK_evento_tipo_evento` (`eventType` ASC)
;

ALTER TABLE `Event` 
 ADD INDEX `IXFK_evento_usuario` (`userID` ASC)
;

ALTER TABLE `Event_record` 
 ADD INDEX `IXFK_historial_evento_estado_evento` (`stateID` ASC)
;

ALTER TABLE `Event_record` 
 ADD INDEX `IXFK_historial_evento_evento` (`eventID` ASC)
;

ALTER TABLE `Items_per_request` 
 ADD INDEX `IXFK_items_por_solicitud_item` (`itemID` ASC)
;

ALTER TABLE `Items_per_request` 
 ADD INDEX `IXFK_items_por_solicitud_Solicitud` (`requestID` ASC)
;

ALTER TABLE `Items_per_room` 
 ADD INDEX `IXFK_Items_per_room_Item` (`itemID` ASC)
;

ALTER TABLE `Items_per_room` 
 ADD INDEX `IXFK_Items_per_room_Room` (`roomID` ASC, `sectionalID` ASC, `blockID` ASC)
;

ALTER TABLE `Request` 
 ADD INDEX `IXFK_Solicitud_Aula` (`roomID` ASC, `sectionalID` ASC, `blockID` ASC)
;

ALTER TABLE `Request` 
 ADD INDEX `IXFK_Solicitud_estado_solicitud` (`stateID` ASC)
;

ALTER TABLE `Request` 
 ADD INDEX `IXFK_Solicitud_evento` (`eventID` ASC)
;

ALTER TABLE `Request` 
 ADD INDEX `IXFK_Solicitud_tipo_solicitud` (`requestType` ASC)
;

ALTER TABLE `Request` 
 ADD INDEX `IXFK_Solicitud_usuario` (`createdBy` ASC)
;

ALTER TABLE `Request_record` 
 ADD INDEX `IXFK_historial_solicitud_Solicitud` (`requestID` ASC)
;

ALTER TABLE `Request_record` 
 ADD INDEX `IXFK_historial_solicitud_usuario` (`uptatedBy` ASC)
;

ALTER TABLE `Room` 
 ADD INDEX `IXFK_Aula_Bloque` (`blockID` ASC, `sectionalID` ASC)
;

ALTER TABLE `Room` 
 ADD INDEX `IXFK_Aula_tipo_aulas` (`type` ASC)
;

ALTER TABLE `Rooms_per_Logistic_Unit` 
 ADD INDEX `IXFK_Rooms_per_Logisctic_Unit_Room` (`roomID` ASC, `sectionalID` ASC, `blockID` ASC)
;

ALTER TABLE `Rooms_per_Logistic_Unit` 
 ADD INDEX `IXFK_Rooms_per_Logisctic_Unit_User` (`logisticUnit` ASC)
;

ALTER TABLE `Rooms_per_section` 
 ADD INDEX `IXFK_Rooms_per_section_Room` (`roomID` ASC, `sectionalID` ASC, `blockID` ASC)
;

ALTER TABLE `Rooms_per_section` 
 ADD INDEX `IXFK_Rooms_per_section_Section` (`sectionID` ASC)
;

ALTER TABLE `Rooms_per_turn` 
 ADD INDEX `IXFK_aulas_por_turno_Aula` (`roomID` ASC, `sectionalID` ASC, `blockID` ASC)
;

ALTER TABLE `Rooms_per_turn` 
 ADD INDEX `IXFK_aulas_por_turno_turno` (`turnID` ASC)
;

ALTER TABLE `Section` 
 ADD INDEX `IXFK_Section_User` (`logisticUnit` ASC)
;

ALTER TABLE `Turn` 
 ADD INDEX `IXFK_turno_usuario` (`auxiliarID` ASC)
;

ALTER TABLE `Turn_record` 
 ADD INDEX `IXFK_Turn_record_Turn` (`turnID` ASC)
;

ALTER TABLE `User_record` 
 ADD INDEX `IXFK_historial_usuario_usuario` (`username` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `Block` 
 ADD CONSTRAINT `FK_Block_Sectional`
	FOREIGN KEY (`sectionalID`) REFERENCES `Sectional` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event` 
 ADD CONSTRAINT `FK_evento_Aula`
	FOREIGN KEY (`roomID`, `sectionalID`, `blockID`) REFERENCES `Room` (`id`,`sectionalID`,`blockID`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event` 
 ADD CONSTRAINT `FK_evento_estado_evento`
	FOREIGN KEY (`stateID`) REFERENCES `Event_state` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event` 
 ADD CONSTRAINT `FK_evento_tipo_evento`
	FOREIGN KEY (`eventType`) REFERENCES `Event_type` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event` 
 ADD CONSTRAINT `FK_evento_usuario`
	FOREIGN KEY (`userID`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Event_record` 
 ADD CONSTRAINT `FK_historial_evento_estado_evento`
	FOREIGN KEY (`stateID`) REFERENCES `Event_state` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Items_per_request` 
 ADD CONSTRAINT `FK_items_por_solicitud_Solicitud`
	FOREIGN KEY (`requestID`) REFERENCES `Request` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Items_per_room` 
 ADD CONSTRAINT `FK_Items_per_room_Item`
	FOREIGN KEY (`itemID`) REFERENCES `Item` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Items_per_room` 
 ADD CONSTRAINT `FK_Items_per_room_Room`
	FOREIGN KEY (`roomID`, `sectionalID`, `blockID`) REFERENCES `Room` (`id`,`sectionalID`,`blockID`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
 ADD CONSTRAINT `FK_Solicitud_Aula`
	FOREIGN KEY (`roomID`, `sectionalID`, `blockID`) REFERENCES `Room` (`id`,`sectionalID`,`blockID`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
 ADD CONSTRAINT `FK_Solicitud_estado_solicitud`
	FOREIGN KEY (`stateID`) REFERENCES `Request_state` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
 ADD CONSTRAINT `FK_Solicitud_evento`
	FOREIGN KEY (`eventID`) REFERENCES `Event` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
 ADD CONSTRAINT `FK_Solicitud_tipo_solicitud`
	FOREIGN KEY (`requestType`) REFERENCES `Request_type` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request` 
 ADD CONSTRAINT `FK_Solicitud_usuario`
	FOREIGN KEY (`createdBy`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request_record` 
 ADD CONSTRAINT `FK_historial_solicitud_Solicitud`
	FOREIGN KEY (`requestID`) REFERENCES `Request` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Request_record` 
 ADD CONSTRAINT `FK_historial_solicitud_usuario`
	FOREIGN KEY (`uptatedBy`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Room` 
 ADD CONSTRAINT `FK_Aula_Bloque`
	FOREIGN KEY (`blockID`, `sectionalID`) REFERENCES `Block` (`number`,`sectionalID`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Room` 
 ADD CONSTRAINT `FK_Aula_tipo_aulas`
	FOREIGN KEY (`type`) REFERENCES `Classroom_type` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_Logistic_Unit` 
 ADD CONSTRAINT `FK_Rooms_per_Logisctic_Unit_Room`
	FOREIGN KEY (`roomID`, `sectionalID`, `blockID`) REFERENCES `Room` (`id`,`sectionalID`,`blockID`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_section` 
 ADD CONSTRAINT `FK_Rooms_per_section_Room`
	FOREIGN KEY (`roomID`, `sectionalID`, `blockID`) REFERENCES `Room` (`id`,`sectionalID`,`blockID`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_section` 
 ADD CONSTRAINT `FK_Rooms_per_section_Section`
	FOREIGN KEY (`sectionID`) REFERENCES `Section` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_turn` 
 ADD CONSTRAINT `FK_aulas_por_turno_Aula`
	FOREIGN KEY (`roomID`, `sectionalID`, `blockID`) REFERENCES `Room` (`id`,`sectionalID`,`blockID`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Rooms_per_turn` 
 ADD CONSTRAINT `FK_aulas_por_turno_turno`
	FOREIGN KEY (`turnID`) REFERENCES `Turn` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Section` 
 ADD CONSTRAINT `FK_Section_User`
	FOREIGN KEY (`logisticUnit`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Turn` 
 ADD CONSTRAINT `FK_turno_usuario`
	FOREIGN KEY (`auxiliarID`) REFERENCES `User` (`username`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Turn_record` 
 ADD CONSTRAINT `FK_Turn_record_Turn`
	FOREIGN KEY (`turnID`) REFERENCES `Turn` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1 
;
