CREATE TABLE `consultorio`.`usuarios` (
  `id` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `num_telefono` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `correo_verificado` TINYINT NOT NULL DEFAULT 0,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `edad` INT NULL,
  `usuarioscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
COMMENT = 'Esto es un comentario.';



CREATE TABLE `consultorio`.`roles_usuarios` (
  `id_rol` INT NOT NULL,
  `id_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_rol`, `id_usuario`),
  INDEX `id_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `idrol`
    FOREIGN KEY (`id_rol`)
    REFERENCES `consultorio`.`roles` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `idusuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `consultorio`.`usuarios` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
COMMENT = 'Asociación de los roles con los usuarios';

CREATE TABLE `consultorio`.`consultorios` (
  `id_consultorio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(255) NULL,
  PRIMARY KEY (`id_consultorio`))
COMMENT = 'Tabla de los consultorios donde se van a llevar cabo las citas';

CREATE TABLE `consultorio`.`citas_medicas` (
  `id_cita` INT NOT NULL AUTO_INCREMENT,
  `id_doctor` VARCHAR(45) NOT NULL,
  `id_paciente` VARCHAR(45) NOT NULL,
  `id_consultorio` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fin` TIME NOT NULL,
  PRIMARY KEY (`id_cita`),
  INDEX `iddoctor_idx` (`id_doctor` ASC) VISIBLE,
  INDEX `idpaciente_idx` (`id_paciente` ASC) VISIBLE,
  INDEX `idconsultorio_idx` (`id_consultorio` ASC) VISIBLE,
  CONSTRAINT `iddoctor`
    FOREIGN KEY (`id_doctor`)
    REFERENCES `consultorio`.`usuarios` (`id_usuario`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `idpaciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `consultorio`.`usuarios` (`id_usuario`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `idconsultorio`
    FOREIGN KEY (`id_consultorio`)
    REFERENCES `consultorio`.`consultorios` (`id_consultorio`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
COMMENT = 'Tabla de citas médicas';

CREATE TABLE `consultorio`.`medicamentos` (
  `id_medicamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `presentacion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_medicamento`))
COMMENT = 'Tabla de medicamentos';

CREATE TABLE `consultorio`.`formulas_medicas` (
  `id_formula_medica` INT NOT NULL AUTO_INCREMENT,
  `id_paciente` VARCHAR(45) NOT NULL,
  `id_doctor` VARCHAR(45) NOT NULL,
  `fecha_generacion` DATETIME NOT NULL,
  `fecha_vencimiento` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_formula_medica`),
  INDEX `iddoctor_idx` (`id_doctor` ASC) VISIBLE,
  INDEX `idpaciente_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `iddoctorformula`
    FOREIGN KEY (`id_doctor`)
    REFERENCES `consultorio`.`usuarios` (`id_usuario`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `idpacienteformula`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `consultorio`.`usuarios` (`id_usuario`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
COMMENT = 'Tabla de formulas medicas';
