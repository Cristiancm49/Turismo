-- Insertar datos en la tabla metodo_pago
    INSERT INTO metodo_pago (metodo_pago) VALUES
    ('Efectivo'),
    ('Transferencia bancaria'),
    ('Tarjeta de crédito');


-- Insertar datos en la tabla cupon_descuento
    INSERT INTO cupon_descuento (cupon, descuento) 
    VALUES
    ('DESC10', 10),
    ('DESC20', 20),
    ('DESC18', 18),
    ('DESC30', 30);


-- Insertar datos en la tabla rol
  INSERT INTO rol(nombre_rol) VALUES
  ('Admin'),
  ('Cliente'),
  ('Empresa');


-- Insertar datos en la tabla Usuario
    INSERT INTO usuario (email, contrasena, rol_id)
    VALUES
    ('usuario1@example.com', 'contrasena1', 2),
    ('usuario2@example.com', 'contrasena2', 3),
    ('usuario3@example.com', 'contrasena3', 2),
    ('usuario4@example.com', 'contrasena4', 3),
    ('usuario5@example.com', 'contrasena5', 2),
    ('usuario6@example.com', 'contrasena6', 3),
    ('usuario7@example.com', 'contrasena7', 2),
    ('usuario8@example.com', 'contrasena8', 3),
    ('usuario9@example.com', 'contrasena9', 2),
    ('usuario10@example.com', 'contrasena10', 3),
    ('usuario11@example.com', 'contrasena11', 2),
    ('usuario12@example.com', 'contrasena12', 3),
    ('usuario13@example.com', 'contrasena13', 2),
    ('usuario14@example.com', 'contrasena14', 3),
    ('usuario15@example.com', 'contrasena15', 2),
    ('usuario16@example.com', 'contrasena16', 3),
    ('usuario17@example.com', 'contrasena17', 2),
    ('usuario18@example.com', 'contrasena18', 3),
    ('usuario19@example.com', 'contrasena19', 2),
    ('usuario20@example.com', 'contrasena20', 3);


-- Insertar datos en la tabla cliente
    INSERT INTO cliente (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, tipo_documento, numero_documento, telefono, fecha_nacimiento, usuario_id)
    VALUES
    ('Carlos', 'Alberto', 'Gomez', 'Perez', 'TI', 12455, 30567, '1990-05-15', 1),
    ('Laura', 'Isabel', 'Martinez', 'Lopez', 'CC', 9321, 31043, '1985-02-28', 2),
    ('Javier', 'Andres', 'Hernandez', 'Vargas', 'TI', 5555, 32133, '1978-11-10', 3),
    ('Ana', 'Maria', 'Rodriguez', 'Diaz', 'CC', 44444, 31544, '1992-07-22', 4),
    ('Camila', 'Alejandra', 'Gutierrez', 'Gomez', 'TI', 333333, 30045, '1980-09-18', 5),
    ('Juan', 'Pablo', 'Perez', 'Castro', 'CC', 6666, 35556, '1975-04-04', 6),
    ('Martha', 'Elena', 'Ramirez', 'Soto', 'TI', 7777, 326667, '1988-12-05', 7),
    ('Pedro', 'Antonio', 'Lopez', 'Garcia', 'CC', 88888, 315678, '1983-06-30', 8),
    ('Catalina', 'Isabel', 'Mendoza', 'Herrera', 'TI', 9999, 308889, '1982-03-12', 9),
    ('Luis', 'Fernando', 'Diaz', 'Salazar', 'CC', 1123, 3890, '1995-08-20', 10);


-- Insertar datos en la tabla menu
    INSERT INTO menu (nombre_menu, descripcion_menu, precio)
    VALUES
    ('Hamburguesa Clásica', 'Deliciosa hamburguesa con carne de res, lechuga, tomate y queso.', 25000),
    ('Pizza Margarita', 'Pizza tradicional con salsa de tomate, mozzarella y albahaca fresca.', 30000),
    ('Ensalada César', 'Ensalada fresca con pollo a la parrilla, lechuga romana, queso parmesano y aderezo César.', 18000),
    ('Sushi Variado', 'Combinación de rollos de sushi con diferentes ingredientes y salsas.', 35000),
    ('Pasta Alfredo', 'Pasta fettuccine en salsa Alfredo con pollo y champiñones.', 28000),
    ('Tacos de Carnitas', 'Tacos mexicanos con carnitas de cerdo, cebolla y cilantro.', 22000),
    ('Sopa Tom Yum', 'Sopa tailandesa con langostinos, setas y hierbas aromáticas.', 26000),
    ('Filete de Salmón', 'Filete de salmón a la parrilla con salsa de limón y eneldo.', 32000),
    ('Burrito Vegetariano', 'Burrito relleno de frijoles, arroz, verduras y queso.', 20000),
    ('Ceviche de Camarones', 'Ceviche fresco con camarones, limón, cilantro y aguacate.', 28000),
    ('Parrillada Mixta', 'Selección de carnes a la parrilla con chimichurri y guarniciones.', 40000),
    ('Tarta de Manzana', 'Deliciosa tarta de manzana con canela y helado de vainilla.', 15000),
    ('Pollo al Curry', 'Pollo en salsa de curry con arroz basmati y naan.', 27000),
    ('Pastel de Chocolate', 'Pastel de chocolate con cobertura de ganache y frutas frescas.', 18000),
    ('Tacos de Pescado', 'Tacos de pescado con repollo rallado y salsa de aguacate.', 23000),
    ('Risotto de Champiñones', 'Risotto cremoso con champiñones y queso parmesano.', 25000),
    ('Sándwich Club', 'Sándwich triple capa con pollo, tocino, lechuga y tomate.', 19000),
    ('Empanadas Colombianas', 'Empanadas rellenas de carne y papa con ají.', 16000);


-- Insertar registros en la tabla transporte
    INSERT INTO transporte (transporte, capacidad_maxima, precio_por_persona)
    VALUES
    ('Bus Turístico', 40, 15000),
    ('Automóvil Privado', 4, 30000),
    ('Furgoneta de Lujo', 15, 20000),
    ('Bicicleta Tándem', 2, 10000),
    ('Helicóptero Privado', 4, 80000),
    ('Barco de Recreo', 20, 25000),
    ('Moto de Montaña', 1, 12000);


-- Inserta registros en la tabla tipo_paquete
    INSERT INTO tipo_paquete(tipo_paquete, cantidad_personas)
    VALUES
    ('Básico Individual', 1),
    ('Basico familiar', 5),
    ('PremiumF', 10),
    ('Especial Pareja', 2),
    ('VIP', 2),
    ('Personalizado', 20),
    ('Económico', 7);


-- Inserta  registros en la tabla departamento
    INSERT INTO departamento (departamento)
    VALUES
    ('Antioquia'),
    ('Atlántico'),
    ('Bolívar'),
    ('Boyacá'),
    ('Caldas'),
    ('Cundinamarca'),
    ('Magdalena'),
    ('Meta'),
    ('Nariño'),
    ('Santander');


-- Inserta registros en la tabla municipio
    INSERT INTO municipio (municipio)
    VALUES
    ('Medellín'),
    ('Barranquilla'),
    ('Cartagena'),
    ('Tunja'),
    ('Manizales'),
    ('Bogotá'),
    ('Santa Marta'),
    ('Villavicencio'),
    ('Pasto'),
    ('Bucaramanga');


-- Inserta registros en la tabla empresa 
    INSERT INTO empresa (logo, nombre_empresa, nit, numero_contacto, email_contacto, usuario_id)
    VALUES
    ('logo_empresa1.jpg', 'Restaurante La Delicia',  1236789, 30012567, 'contacto1@example.com', 11),
    ('logo_empresa2.jpg', 'Pizzería Bella Napoli',  876541, 31098763, 'contacto2@example.com', 12),
    ('logo_empresa3.jpg', 'Sushi Express',  555555, 320113, 'contacto3@example.com', 13),
    ('logo_empresa4.jpg', 'Pastelería Dulce Sabor',  44444, 152234, 'contacto4@example.com', 14),
    ('logo_empresa5.jpg', 'Tacos y Más',  33333, 304445, 'contacto5@example.com', 15),
    ('logo_empresa6.jpg', 'Ristorante Italiano',  66666, 310455, 'contacto6@example.com', 16),
    ('logo_empresa7.jpg', 'Mariscos del Caribe',  77777, 320566, 'contacto7@example.com', 17),
    ('logo_empresa8.jpg', 'Pollos Don Pedro',  8888888, 315677, 'contacto8@example.com', 19),
    ('logo_empresa9.jpg', 'Vegetariano Natural',  9999999, 300788, 'contacto9@example.com', 18),
    ('logo_empresa10.jpg', 'Heladería Frío y Dulce', 23123, 31089, 'contacto10@example.com', 20);


-- Inserta  registros en la tabla ubicacion
    INSERT INTO ubicacion (calle, numero, departamento_id, municipio_id, empresa_id)
    VALUES
    (123, 456, 1, 1, 1),
    (789, 321, 2, 2, 2),
    (456, 789, 3, 3, 3),
    (321, 654, 4, 4, 4),
    (987, 123, 5, 5, 5),
    (654, 987, 6, 6, 6),
    (789, 456, 7, 7, 7),
    (987, 654, 8, 8, 8),
    (321, 123, 9, 9, 9),
    (654, 321, 10, 10, 10);

-- Insertar registros en la tabbla categoria paquete
    INSERT INTO categoria_paquete(categoria_paquete)
    VALUES
    ('PLAYA'),
    ('MAR'),
    ('CAMPO'),
    ('PSICINA'),
    ('CABALLOS');
-- Inserta registros en las tablas paquete 

    INSERT INTO paquete (imgUrl, nombre_paquete, precio_por_persona, descripcion_paquete, menu_id, disponibilidad, tipo_paquete_id, transporte_id, empresa_id)
    VALUES
    ('img1.jpg', 'Paquete Aventura', 30000, 'Experimenta emociones extremas con este paquete de aventura.', 1, 20, 1, 1, 1);
    ('img2.jpg', 'Paquete Romántico', 25000, 'Vive una experiencia romántica con cena y música en vivo.', 2, 10, 3, 2, 2),
    ('img3.jpg', 'Paquete Familiar', 20000, 'Disfruta de un día en familia con actividades para todas las edades.', 1, 30, 2, 3, 3),
    ('img4.jpg', 'Paquete Cultural', 18000, 'Sumérgete en la cultura local con este paquete especial.', 2, 15, 4, 4, 4),
    ('img5.jpg', 'Paquete Wellness', 35000, 'Relájate y rejuvenece con tratamientos de bienestar y spa.', 3, 12, 5, 5, 5),
    ('img6.jpg', 'Paquete Gastronómico', 28000, 'Descubre sabores únicos con este recorrido gastronómico.', 4, 18, 1, 6, 6),
    ('img7.jpg', 'Paquete Deportivo', 32000, 'Para los amantes del deporte, este paquete te ofrece acción y diversión.', 5, 25, 3, 7, 7),
    ('img8.jpg', 'Paquete Playa', 30000, 'Relájate bajo el sol y disfruta de la playa con este paquete.', 6, 20, 2, 4, 8),
    ('img9.jpg', 'Paquete Ecológico', 27000, 'Explora la naturaleza y contribuye a la conservación con este paquete.', 7, 15, 4, 2, 9),
    ('img10.jpg', 'Paquete Cultural', 26000, 'Sumérgete en la historia y la cultura local con este paquete.', 8, 22, 5, 1, 10),
    ('img11.jpg', 'Paquete De Lujo', 40000, 'Vive una experiencia de lujo con este paquete exclusivo.', 9, 8, 1, 1, 1),
    ('img12.jpg', 'Paquete Aventura Extrema', 45000, 'Para los más audaces, este paquete ofrece adrenalina pura.', 5, 10, 3, 2, 2),
    ('img13.jpg', 'Paquete Gastronómico Gourmet', 38000, 'Una experiencia culinaria de alto nivel con este paquete.', 5, 14, 1, 3, 3),
    ('img14.jpg', 'Paquete Relax y Bienestar', 32000, 'Desconéctate del estrés con este paquete de relajación.', 2, 16, 5, 4, 4),
    ('img15.jpg', 'Paquete Deportivo Acuático', 36000, 'Actividades acuáticas emocionantes en este paquete deportivo.', 3, 18, 3, 5, 5),
    ('img16.jpg', 'Paquete Cultural Nocturno', 28000, 'Descubre la cultura local en la noche con este paquete.', 4, 12, 4, 6, 6),
    ('img17.jpg', 'Paquete Familiar Divertido', 22000, 'Diversión para toda la familia con este paquete especial.', 5, 28, 2, 7, 7),
    ('img18.jpg', 'Paquete Romántico Sunset', 31000, 'Una velada romántica con la puesta de sol en este paquete.', 6, 8, 3, 5, 8);


-- Relación muchos a muchos entre paquete y categoria_paquete
    INSERT INTO paquete_categoria_relacion (descrpcion, paquete_id, categoria_paquete_id)
    VALUES
    ('Aventura', 19, 1),
    ('Romántico', 20, 4),
    ('Familiar', 21, 2),
    ('Cultural', 22, 3),
    ('Wellness', 23, 5),
    ('Gastronómico', 24, 1),
    ('Deportivo', 25, 5),
    ('Playa', 28, 2),
    ('Ecológico', 29, 3),
    ('Cultural', 30, 4),
    ('De Lujo', 31, 1);


-- Reservas
    INSERT INTO reserva (cantidad_personas, fecha_reserva, fecha_salida, fecha_regreso, estado_pago, precio_total, metodo_pago_id, cupon_descuento_id, cliente_id, paquete_id)
    VALUES
    (2, '2023-12-01', '2024-01-15', '2024-01-20', true, 10000, 1, 1, 1, 21),
    (1, '2023-11-20', '2024-02-10', '2024-02-15', false, 40000, 2, 2, 2, 22),
    (4, '2023-10-15', '2024-03-05', '2024-03-10', false, 20000, 3, 3,3, 23),
    (3, '2023-09-28', '2024-04-18', '2024-04-25', false, 3000, 1, 4, 4, 24),
    (2, '2023-08-12', '2024-05-10', '2024-05-15', false, 1000, 2, 1,5, 25),
    (1, '2023-07-25', '2024-06-22', '2024-06-30', true, 300, 3, 2, 6, 26),
    (2, '2023-06-18', '2024-07-15', '2024-07-20', false, NULL, 1, 3, 7, 27),
    (1, '2023-05-30', '2024-08-12', '2024-08-18', false, 1000, 2, 4, 8, 28),
    (3, '2023-04-15', '2024-09-05', '2024-09-12', false, NULL, 3, 1, 9, 29),
    (2, '2023-03-22', '2024-10-08', '2024-10-15', true, 20000, 1, 3, 10, 30);

-- Variables de entrada
DO $$ 
DECLARE 
    v_cupon_descuento_id INT := 1;   -- ID del cupón de descuento (ajusta según sea necesario)
    v_cantidad_personas INT := 2;     -- Cantidad de personas (ajusta según sea necesario)
    v_metodo_pago_id INT := 1;        -- ID del método de pago (ajusta según sea necesario)
    v_paquete_id INT := 1;            -- ID del paquete (ajusta según sea necesario)
    v_cliente_id INT := 1;            -- ID del cliente (ajusta según sea necesario)
    V_estado_pago BOOLEAN := TRUE;
    v_resena_id INT := 1;             -- ID de la reseña (ajusta según sea necesario)
    v_fecha_reserva DATE := '2023-12-01';  -- Fecha de reserva (ajusta según sea necesario)
    v_fecha_salida DATE := '2024-01-15';   -- Fecha de salida (ajusta según sea necesario)
    v_fecha_regreso DATE := '2024-01-20';  -- Fecha de regreso (ajusta según sea necesario)
    v_precio_total FLOAT;             -- Variable de salida para el precio total
BEGIN
    -- Llamada al procedimiento almacenado para calcular el precio de la reserva
    PERFORM calcular_precio_reserva(
        v_cupon_descuento_id, 
        v_cantidad_personas, 
        v_metodo_pago_id, 
        v_paquete_id, 
        v_cliente_id, 
        v_resena_id, 
        v_fecha_reserva, 
        v_fecha_salida, 
        v_fecha_regreso, 
        v_precio_total
    );

    -- Insertar en la tabla reserva con el precio total calculado
    INSERT INTO reserva (
        cantidad_personas, 
        fecha_reserva, 
        fecha_salida, 
        fecha_regreso, 
        estado_pago, 
        precio_total, 
        metodo_pago_id, 
        cupon_descuento_id, 
        cliente_id, 
        paquete_id
    ) VALUES (
        v_cantidad_personas, 
        v_fecha_reserva, 
        v_fecha_salida, 
        v_fecha_regreso, 
        V_estado_pago,
        v_precio_total,
        v_metodo_pago_id, 
        v_cupon_descuento_id, 
        v_cliente_id, 
        v_paquete_id  
    );

    -- Resultado
    RAISE NOTICE 'Reserva creada con Precio Total: %', v_precio_total;
END $$;
-- Inserta  registros en las tablas resena 

    INSERT INTO resena (calificacion, resena, reserva)
    VALUES
    (4, '¡Increíble experiencia! Definitivamente volveré.',  1),
    (5, 'El paquete romántico superó nuestras expectativas.',  2),
    (3, 'Buena opción para familias, pero esperábamos más actividades.',  3),
    (5, 'La experiencia cultural fue enriquecedora y divertida.',  4),
    (4, 'El spa y tratamientos de bienestar fueron relajantes.',  5),
    (5, 'La gastronomía local en el recorrido fue exquisita.',  6),
    (3, 'Para los amantes del deporte, ¡muy recomendado!',  7),
    (5, 'Disfrutamos de la playa y la atención del personal.',  8),
    (4, 'Interesante propuesta ecológica, pero esperábamos más información.',  9),
    (4, 'Excelente guía en el recorrido cultural nocturno.',  10);