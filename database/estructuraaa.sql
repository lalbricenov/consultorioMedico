
-- ************************************** `usuarios`

CREATE TABLE `usuarios`
(
 `id_usuario`        varchar(45) NOT NULL ,
 `correo`            varchar(45) NOT NULL ,
 `num_telefono`      varchar(45) NOT NULL ,
 `password`          varchar(45) NOT NULL ,
 `correo_verificado` boolean NOT NULL DEFAULT 0 ,
 `nombres`           varchar(45) NOT NULL ,
 `apellidos`         varchar(45) NOT NULL ,
 `edad`              int NOT NULL ,

PRIMARY KEY (`id_usuario`)
);

-- ************************************** `roles`

CREATE TABLE `roles`
(
 `id_rol`     int NOT NULL AUTO_INCREMENT ,
 `nombre_rol` varchar(45) NOT NULL ,

PRIMARY KEY (`id_rol`)
);


-- ************************************** `roles_usuarios`

CREATE TABLE `roles_usuarios`
(
 `id_rol`     int NOT NULL ,
 `id_usuario` varchar(45) NOT NULL ,

PRIMARY KEY (`id_rol`, `id_usuario`),
KEY `fkIdx_27` (`id_rol`),
CONSTRAINT `FK_25` FOREIGN KEY `fkIdx_27` (`id_rol`) REFERENCES `roles` (`id_rol`),
KEY `fkIdx_30` (`id_usuario`),
CONSTRAINT `FK_28` FOREIGN KEY `fkIdx_30` (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
);


-- ************************************** `consultorios`

CREATE TABLE `consultorios`
(
 `id_consultorio` int NOT NULL AUTO_INCREMENT ,
 `nombre`         varchar(45) NOT NULL ,

PRIMARY KEY (`id_consultorio`)
);


-- ************************************** `citas_medicas`

CREATE TABLE `citas_medicas`
(
 `id_cita`        int NOT NULL AUTO_INCREMENT ,
 `id_doctor`      varchar(45) NOT NULL ,
 `id_paciente`    varchar(45) NOT NULL ,
 `id_consultorio` int NOT NULL ,
 `fecha`          date NOT NULL ,
 `hora`           time NOT NULL ,
 `duracion`       time NOT NULL ,

PRIMARY KEY (`id_cita`),
KEY `fkIdx_38` (`id_doctor`),
CONSTRAINT `FK_36` FOREIGN KEY `fkIdx_38` (`id_doctor`) REFERENCES `usuarios` (`id_usuario`),
KEY `fkIdx_41` (`id_paciente`),
CONSTRAINT `FK_39` FOREIGN KEY `fkIdx_41` (`id_paciente`) REFERENCES `usuarios` (`id_usuario`),
KEY `fkIdx_48` (`id_consultorio`),
CONSTRAINT `FK_46` FOREIGN KEY `fkIdx_48` (`id_consultorio`) REFERENCES `consultorios` (`id_consultorio`)
);

-- ************************************** `formulas_medicas`

CREATE TABLE `formulas_medicas`
(
 `id_formula_medica` int NOT NULL AUTO_INCREMENT ,
 `id_paciente`       varchar(45) NOT NULL ,
 `id_doctor`         varchar(45) NOT NULL ,
 `fecha_generacion`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `fecha_vencimiento` date NULL ,

PRIMARY KEY (`id_formula_medica`),
KEY `fkIdx_62` (`id_paciente`),
CONSTRAINT `FK_60` FOREIGN KEY `fkIdx_62` (`id_paciente`) REFERENCES `usuarios` (`id_usuario`),
KEY `fkIdx_65` (`id_doctor`),
CONSTRAINT `FK_63` FOREIGN KEY `fkIdx_65` (`id_doctor`) REFERENCES `usuarios` (`id_usuario`)
);

-- ************************************** `medicamentos`

CREATE TABLE `medicamentos`
(
 `id_medicamento` int NOT NULL ,
 `nombre`         varchar(255) NOT NULL ,
 `presentacion`   varchar(255) NOT NULL ,

PRIMARY KEY (`id_medicamento`)
);



-- ************************************** `asignacion_medicamentos`

CREATE TABLE `asignacion_medicamentos`
(
 `id_formula_medica` int NOT NULL ,
 `id_medicamento`    int NOT NULL ,
 `instrucciones`     varchar(255) NOT NULL ,

PRIMARY KEY (`id_formula_medica`, `id_medicamento`),
KEY `fkIdx_69` (`id_formula_medica`),
CONSTRAINT `FK_67` FOREIGN KEY `fkIdx_69` (`id_formula_medica`) REFERENCES `formulas_medicas` (`id_formula_medica`),
KEY `fkIdx_73` (`id_medicamento`),
CONSTRAINT `FK_71` FOREIGN KEY `fkIdx_73` (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`)
);