CREATE TABLE `usuarios`
(
 `id_usuario`        varchar(45) NOT NULL ,
 `correo`            varchar(45) NOT NULL ,
 `num_telefono`      varchar(45) NOT NULL ,
 `password`          varchar(45) NOT NULL ,
 `correo_verificado` boolean NOT NULL DEFAULT 0 ,
 `nombres`           varchar(45) NOT NULL ,
 `apellidos`         varchar(45) NOT NULL ,
 `edad`              int NOT NULL 
);

CREATE TABLE `roles`
(
 `id_rol`     int NOT NULL AUTO_INCREMENT ,
 `nombre_rol` varchar(45) NOT NULL 
);
CREATE TABLE `roles_usuarios`
(
 `id_rol`     int NOT NULL ,
 `id_usuario` varchar(45) NOT NULL 
);

CREATE TABLE `formulas_medicas`
(
 `id_formula_medica` int NOT NULL AUTO_INCREMENT ,
 `id_paciente`       varchar(45) NOT NULL ,
 `id_doctor`         varchar(45) NOT NULL ,
 `fecha_generacion`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `fecha_vencimiento` date NULL 
);

CREATE TABLE `medicamentos`
(
 `id_medicamento` int NOT NULL ,
 `nombre`         varchar(255) NOT NULL ,
 `presentacion`   varchar(255) NOT NULL 
);

CREATE TABLE `asignacion_medicamentos`
(
 `id_formula_medica` int NOT NULL ,
 `id_medicamento`    int NOT NULL ,
 `instrucciones`     varchar(255) NOT NULL 
);

CREATE TABLE `consultorios`
(
 `id_consultorio` int NOT NULL AUTO_INCREMENT ,
 `nombre`         varchar(45) NOT NULL 
);

CREATE TABLE `citas_medicas`
(
 `id_cita`        int NOT NULL AUTO_INCREMENT ,
 `id_doctor`      varchar(45) NOT NULL ,
 `id_paciente`    varchar(45) NOT NULL ,
 `id_consultorio` int NOT NULL ,
 `fecha`          date NOT NULL ,
 `hora`           time NOT NULL ,
 `duracion`       time NOT NULL 
);