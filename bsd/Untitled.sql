create database CAQTUR;


\c caqtur;


-- CREANDO TABLAS
  create table metodo_pago(
      metodo_pago_id serial primary key,
      metodo_pago varchar(50) not null
  );


  create table cupon_descuento(
      cupon_descuento_id serial primary key,
      cupon varchar(10) not null,
      descuento int not null
  );


  create table rol(
      rol_id serial primary key,
      nombre_rol varchar(20) not null
  );


  create table usuario(
      usuario_id serial primary key,
      email VARCHAR(255) unique check (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') not null,
      contrasena varchar(25) not null,
      rol_id integer references rol(rol_id)
  );


  create table cliente(
      cliente_id serial primary key,
      primer_nombre varchar(55) not null,
      segundo_nombre varchar(55),
      primer_apellido varchar(55) not null,
      segundo_apellido varchar(55),
      tipo_documento varchar(2) not null,
      numero_documento int not null,
      telefono int not null,
      fecha_nacimiento date not null,
      usuario_id integer references usuario(usuario_id)
  );


  create table menu(
      menu_id serial primary key,
      nombre_menu varchar(50) not null,
      descripcion_menu text not null,
      precio float not null
  );


  create table categoria_paquete(
      categoria_paquete_id serial primary key,
      categoria_paquete varchar(50) not null
  );


  create table transporte(
      transporte_id serial primary key,
      transporte varchar(50) not null,
      capacidad_maxima int not null,
      precio_por_persona float not null
  );



  create table tipo_paquete(
      tipo_paquete_id serial primary key,
      tipo_paquete varchar(50) not null,
      cantidad_personas int not null
  );


  create table departamento(
      departamento_id serial primary key,
      departamento varchar(50) not null
  );


  create table municipio(
      municipio_id serial primary key,
      municipio varchar(50) not null
  );


  create table empresa(
      empresa_id serial primary key,
      logo varchar(255) not null,
      nombre_empresa varchar(50) not null,
      nit int not null,
      numero_contacto int not null,
      email_contacto varchar(255) unique check (email_contacto ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') not null,
      usuario_id integer references usuario(usuario_id)
  );


  create table ubicacion(
      ubicacion_id serial primary key,
      calle int not null,
      numero int,
      departamento_id integer references departamento(departamento_id),
      municipio_id integer references municipio(municipio_id),
      empresa_id integer references empresa(empresa_id)
  );


  create table paquete(
      paquete_id serial primary key,
      imgUrl varchar(255) not null,
      nombre_paquete varchar(100) not null,
      precio_por_persona float not null,
      descripcion_paquete text not null,
      menu_id integer references menu(menu_id),
      disponibilidad int not null,
      tipo_paquete_id integer references tipo_paquete(tipo_paquete_id),
      transporte_id integer references transporte(transporte_id),
      empresa_id integer references empresa(empresa_id)
  );


  CREATE TABLE paquete_categoria_relacion (
      id_relacion SERIAL PRIMARY KEY,
      descrpcion VARCHAR(255),
      paquete_id INT REFERENCES paquete(paquete_id),
      categoria_paquete_id INT REFERENCES categoria_paquete(categoria_paquete_id)
      
  );


  create table reserva(
    reserva_id serial primary key,
    cantidad_personas int not null,  
    fecha_reserva date not null,
    fecha_salida date not null,
    fecha_regreso date not null,
    estado_pago boolean default false,
    precio_total float default null,
    metodo_pago_id integer references metodo_pago(metodo_pago_id),
    cupon_descuento_id integer references cupon_descuento(cupon_descuento_id),
    cliente_id integer references cliente(cliente_id),
    paquete_id integer references paquete(paquete_id)
    
  );

  create table resena(
      resena_id serial primary key,
      calificacion int not null,
      resena varchar(250) not null,
      reserva integer references reserva(reserva_id)
  );


  CREATE TABLE auditoria (
      id serial PRIMARY KEY,
      tabla_afectada VARCHAR(50),
      accion VARCHAR(10),
      fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      detalle JSONB
  );



-- AUDITORIA 
  -- TABLA PAQUETE
    --INSERT
    CREATE OR REPLACE FUNCTION auditoria_paquete_insert()
    RETURNS TRIGGER AS $$
    BEGIN
      INSERT INTO auditoria (tabla_afectada, accion, detalle)
      VALUES ('paquete', 'INSERT', row_to_json(NEW)::jsonb);
      RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER paquete_insert_trigger
    AFTER UPDATE ON paquete
    FOR EACH ROW
    EXECUTE FUNCTION auditoria_paquete_insert();

    -- UPDATE
      CREATE OR REPLACE FUNCTION auditoria_paquete_update()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('paquete', 'UPDATE', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER paquete_update_trigger
      AFTER UPDATE ON paquete
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_paquete_update();

    -- DELETE
      CREATE OR REPLACE FUNCTION auditoria_paquete_delete()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('paquete', 'DELETE', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER paquete_delete_trigger
      AFTER DELETE ON paquete
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_paquete_delete();


  -- TABLA EMPRESA
    -- INSERT
      CREATE OR REPLACE FUNCTION auditoria_empresa_insert()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('empresa', 'INSERT', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER empresa_insert_trigger
      AFTER INSERT ON empresa
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_empresa_insert();

    -- UPDATE
      CREATE OR REPLACE FUNCTION auditoria_empresa_update()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('empresa', 'UPDATE', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER empresa_update_trigger
      AFTER UPDATE ON empresa
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_empresa_update();

    -- DELETE
        CREATE OR REPLACE FUNCTION auditoria_empresa_delete()
        RETURNS TRIGGER AS $$
        BEGIN
          INSERT INTO auditoria (tabla_afectada, accion, detalle)
          VALUES ('empresa', 'DELETE', row_to_json(OLD)::jsonb);
          RETURN OLD;
        END;
        $$ LANGUAGE plpgsql;

        CREATE TRIGGER empresa_delete_trigger
        AFTER DELETE ON empresa
        FOR EACH ROW
        EXECUTE FUNCTION auditoria_empresa_delete();


  -- TABLA CLIENTE
   -- INSERT
      CREATE OR REPLACE FUNCTION auditoria_cliente_insert()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('cliente', 'INSERT', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER cliente_insert_trigger
      AFTER INSERT ON cliente
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_cliente_insert();

   -- UPDATE
      CREATE OR REPLACE FUNCTION auditoria_cliente_update()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('cliente', 'UPDATE', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER cliente_update_trigger
      AFTER UPDATE ON cliente
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_cliente_update();

   -- DELETE
      CREATE OR REPLACE FUNCTION auditoria_cliente_delete()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('cliente', 'DELETE', row_to_json(OLD)::jsonb);
        RETURN OLD;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER cliente_delete_trigger
      AFTER DELETE ON cliente
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_cliente_delete();


  -- TABLA USUARIO
    -- INSERT
      CREATE OR REPLACE FUNCTION auditoria_usuario_insert()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('usuario', 'INSERT', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER usuario_insert_trigger
      AFTER INSERT ON usuario
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_usuario_insert();

    -- UPDATE
      CREATE OR REPLACE FUNCTION auditoria_usuario_update()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('usuario', 'UPDATE', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER usuario_update_trigger
      AFTER UPDATE ON usuario
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_usuario_update();

    -- DELETE
      CREATE OR REPLACE FUNCTION auditoria_usuario_delete()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('usuario', 'DELETE', row_to_json(OLD)::jsonb);
        RETURN OLD;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER usuario_delete_trigger
      AFTER DELETE ON usuario
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_usuario_delete();


  -- TABLA RESERVA
    -- INSERT
        CREATE OR REPLACE FUNCTION auditoria_reserva_insert()
        RETURNS TRIGGER AS $$
        BEGIN
          INSERT INTO auditoria (tabla_afectada, accion, detalle)
          VALUES ('reserva', 'INSERT', row_to_json(NEW)::jsonb);
          RETURN NEW;
        END;
        $$ LANGUAGE plpgsql;

        CREATE TRIGGER reserva_insert_trigger
        AFTER INSERT ON reserva
        FOR EACH ROW
        EXECUTE FUNCTION auditoria_reserva_insert();

    -- UPDATE
        CREATE OR REPLACE FUNCTION auditoria_reserva_update()
        RETURNS TRIGGER AS $$
        BEGIN
          INSERT INTO auditoria (tabla_afectada, accion, detalle)
          VALUES ('reserva', 'UPDATE', row_to_json(NEW)::jsonb);
          RETURN NEW;
        END;
        $$ LANGUAGE plpgsql;

        CREATE TRIGGER reserva_update_trigger
        AFTER UPDATE ON reserva
        FOR EACH ROW
        EXECUTE FUNCTION auditoria_reserva_update();

    -- DELETE
      CREATE OR REPLACE FUNCTION auditoria_reserva_delete()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('reserva', 'DELETE', row_to_json(OLD)::jsonb);
        RETURN OLD;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER reserva_delete_trigger
      AFTER DELETE ON reserva
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_reserva_delete();


  -- TABLA UBICACION
    -- INSERT
      CREATE OR REPLACE FUNCTION auditoria_ubicacion_insert()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('ubicacion', 'INSERT', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER ubicacion_insert_trigger
      AFTER INSERT ON ubicacion
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_ubicacion_insert();

    -- UPDATE
      CREATE OR REPLACE FUNCTION auditoria_ubicacion_update()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('ubicacion', 'UPDATE', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER ubicacion_update_trigger
      AFTER UPDATE ON ubicacion
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_ubicacion_update();

    -- DELETE
      CREATE OR REPLACE FUNCTION auditoria_ubicacion_delete()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('ubicacion', 'DELETE', row_to_json(OLD)::jsonb);
        RETURN OLD;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER ubicacion_delete_trigger
      AFTER DELETE ON ubicacion
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_ubicacion_delete();


  -- TABLA MENU
    -- INSERT
      CREATE OR REPLACE FUNCTION auditoria_menu_insert()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('menu', 'INSERT', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER menu_insert_trigger
      AFTER INSERT ON menu
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_menu_insert();

    -- UPDATE
      CREATE OR REPLACE FUNCTION auditoria_menu_update()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('menu', 'UPDATE', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER menu_update_trigger
      AFTER UPDATE ON menu
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_menu_update();

    -- DELETE
      CREATE OR REPLACE FUNCTION auditoria_menu_delete()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('menu', 'DELETE', row_to_json(OLD)::jsonb);
        RETURN OLD;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER menu_delete_trigger
      AFTER DELETE ON menu
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_menu_delete();


  -- TABLA RESENA
    -- INSERT
      CREATE OR REPLACE FUNCTION auditoria_resena_insert()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('resena', 'INSERT', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER resena_insert_trigger
      AFTER INSERT ON resena
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_resena_insert();

    -- UPDATE
      CREATE OR REPLACE FUNCTION auditoria_resena_update()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('resena', 'UPDATE', row_to_json(NEW)::jsonb);
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER resena_update_trigger
      AFTER UPDATE ON resena
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_resena_update();

    -- DELETE
      CREATE OR REPLACE FUNCTION auditoria_resena_delete()
      RETURNS TRIGGER AS $$
      BEGIN
        INSERT INTO auditoria (tabla_afectada, accion, detalle)
        VALUES ('resena', 'DELETE', row_to_json(OLD)::jsonb);
        RETURN OLD;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER resena_delete_trigger
      AFTER DELETE ON resena
      FOR EACH ROW
      EXECUTE FUNCTION auditoria_resena_delete();



-- ASIGNACION DE PERMISOS, ROLES Y USUARIOS
  -- Creacion de roles
      CREATE ROLE empresa;
      CREATE ROLE cliente;
      CREATE ROLE adm;

  -- Asignar permisos a empresa
      GRANT SELECT, INSERT, UPDATE, DELETE ON table empresa, paquete,  transporte, categoria_paquete, tipo_paquete, ubicacion, paquete_categoria_relacion, empresa   TO empresa;
      GRANT SELECT, UPDATE ON usuario TO empresa;

  -- Asignar permisos a cliente
      GRANT SELECT, UPDATE ON usuario TO cliente;
      GRANT SELECT, UPDATE ON cliente, resena, reserva TO cliente;
      GRANT SELECT ON paquete, empresa TO cliente;

  -- Asignar permisos a admin
      GRANT ALL PRIVILEGES ON usuario, cliente, paquete TO adm;

  -- Crear usuarios y asignar roles
      CREATE USER empresa_user PASSWORD 'contrasena_empresa' IN ROLE empresa;
      CREATE USER cliente_user PASSWORD 'contrasena_cliente' IN ROLE cliente;
      CREATE USER admin_user PASSWORD 'contrasena_admin' IN ROLE adm;

  -- Restricción de cliente para acceder solo a su propio perfil
    ALTER TABLE cliente
    ENABLE ROW LEVEL SECURITY;

    CREATE POLICY cliente_policy
    ON cliente
    USING (cliente_id = current_setting('jwt.claims.cliente_id')::integer);

    ALTER TABLE cliente
    FORCE ROW LEVEL SECURITY;

  -- Restricción de cliente para acceder solo a sus propias reservas
    ALTER TABLE reserva
    ENABLE ROW LEVEL SECURITY;

    CREATE POLICY cliente_reserva_policy
    ON reserva
    USING (cliente_id = current_setting('jwt.claims.cliente_id')::integer);

    ALTER TABLE reserva
    FORCE ROW LEVEL SECURITY;

  -- Restricción de cliente para acceder solo a sus propias reseñas
    ALTER TABLE resena
    ENABLE ROW LEVEL SECURITY;

    CREATE POLICY cliente_resena_policy
    ON resena
    USING (cliente_id = current_setting('jwt.claims.cliente_id')::integer);

    ALTER TABLE resena
    FORCE ROW LEVEL SECURITY;

  -- RESTRICCIONES DE EMPRESA

    ALTER TABLE empresa
    ENABLE ROW LEVEL SECURITY;

    CREATE POLICY empresa_policy
    ON empresa_tabla
    USING (empresa_id = current_setting('jwt.claims.empresa_id')::integer);

    ALTER TABLE empresa
    FORCE ROW LEVEL SECURITY;


  -- Restricción de empresa para acceder solo a sus propios paquetes
    ALTER TABLE paquete
    ENABLE ROW LEVEL SECURITY;

    CREATE POLICY empresa_paquete_policy
    ON paquete
    USING (empresa_id = current_setting('jwt.claims.empresa_id')::integer);

    ALTER TABLE paquete
    FORCE ROW LEVEL SECURITY;



-- TRIGGERS

  -- TRIGGER PARA DISPONIBILIDAD DE PAQUETES
    -- restar cupo despues de una reserva
    CREATE OR REPLACE FUNCTION restar_cupo_paquete()
    RETURNS TRIGGER AS $$
    BEGIN
        UPDATE paquete
        SET cupo = cupo - 1
        WHERE paquete_id = NEW.paquete_id;

        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER tr_restar_cupo_paquete
    AFTER INSERT ON reserva
    FOR EACH ROW
    EXECUTE FUNCTION restar_cupo_paquete();  

    -- Sumar a cupo despues de terminar una reserva

    CREATE OR REPLACE FUNCTION restablecer_cupo_paquete()
    RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.fecha_regreso < CURRENT_DATE THEN
            UPDATE paquete
            SET cupo = cupo + 1
            WHERE paquete_id = NEW.paquete_id;
        END IF;

        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;
    CREATE TRIGGER tr_restablecer_cupo_paquete
    AFTER UPDATE ON reserva
    FOR EACH ROW
    EXECUTE FUNCTION restablecer_cupo_paquete();

  -- TRIGGER PARA FECHAS DE FIESTAS
    -- Para diciembre
      CREATE OR REPLACE FUNCTION aumentar_precio_diciembre()
      RETURNS TRIGGER AS $$
      BEGIN
        IF EXTRACT(MONTH FROM NEW.fecha_reserva) = 12 THEN
          NEW.precio_por_persona := NEW.precio_por_persona * 1.20;
        END IF;

      RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER trigger_aumentar_precio
      BEFORE INSERT OR UPDATE ON paquete
      FOR EACH ROW
      EXECUTE FUNCTION aumentar_precio_diciembre();

    -- Resto de Anno
      CREATE OR REPLACE FUNCTION revertir_aumento_precio()
      RETURNS TRIGGER AS $$
      BEGIN
        IF EXTRACT(MONTH FROM NEW.fecha_reserva) = 1 THEN
          NEW.precio_por_persona := NEW.precio_por_persona / 1.20;
        END IF;

        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER trigger_revertir_aumento
      BEFORE UPDATE ON paquete
      FOR EACH ROW
      EXECUTE FUNCTION revertir_aumento_precio();



-- PROCEDIMIENTOS ALMACENADOS
  -- CALCULAR VALOR DE RESERVA
        CREATE OR REPLACE FUNCTION calcular_precio_reserva(
        INOUT p_cupon_descuento NUMERIC,
        INOUT p_cantidad_personas INT,
        INOUT p_precio_total FLOAT,
        IN p_metodo_pago_id INT
        ) 
    RETURNS RECORD AS $$
    DECLARE
        v_precio_por_persona FLOAT;
        v_precio_menu FLOAT;
        v_precio_transporte FLOAT;
        v_descuento FLOAT;
    BEGIN
        -- Obtener precios de la tabla paquete
        SELECT precio_por_persona, menu.precio, transporte.precio_por_persona
        INTO v_precio_por_persona, v_precio_menu, v_precio_transporte
        FROM paquete
        JOIN menu ON paquete.menu_id = menu.menu_id
        JOIN transporte ON paquete.transporte_id = transporte.transporte_id
        WHERE paquete.cupo = p_cupo;

        -- Calcular el precio total sin descuento
        p_precio_total := (v_precio_por_persona + v_precio_menu + v_precio_transporte) * p_cantidad_personas;

        -- Obtener el descuento del cupón
        SELECT descuento INTO v_descuento
        FROM cupon_descuento
        WHERE cupon = p_cupon_descuento;

        -- Aplicar descuento del cupón
        IF v_descuento IS NOT NULL THEN
            p_precio_total := p_precio_total - (p_precio_total * (v_descuento / 100));
        END IF;

        -- Aplicar descuento del 100% si el método de pago es 1
        IF p_metodo_pago_id = 1 THEN
            p_precio_total := 0;  -- Descuento total, el paquete es gratuito
        END IF;

        -- Actualizar el precio total en la reserva
        UPDATE reserva SET precio_total = p_precio_total WHERE cupo = p_cupo;

        -- Reducir el cupo
        UPDATE paquete SET cupo = cupo - p_cantidad_personas WHERE cupo = p_cupo;

    END;
    $$ LANGUAGE plpgsql;