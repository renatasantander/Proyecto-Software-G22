# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'admin@admin.com', password: 'password', password_confirmation: 'password', name: 'Administrador', telefono: '123456789', admin: true) 
User.create(email: 'empleado1@example.com', password: 'password', password_confirmation: 'password', name: 'José Tomás Ibáñez', telefono: '123456789', empleado: true) 
User.create(email: 'empleado2@example.com', password: 'password', password_confirmation: 'password', name: 'Agustín Amenábar', telefono: '123456789', empleado: true) 
User.create(email: 'empleado3@example.com', password: 'password', password_confirmation: 'password', name: 'Renata Santander', telefono: '123456789', empleado: true) 
User.create(email: 'empleado4@example.com', password: 'password', password_confirmation: 'password', name: 'Juan Pérez', telefono: '123456789', empleado: true) 
User.create(email: 'empleado5@example.com', password: 'password', password_confirmation: 'password', name: 'Ana López', telefono: '123456789', empleado: true) 

# Productos

producto1 = Producto.create(
  nombre: "Patrones de Diseño",
  precio: 55990,
  disponibilidad: 5,
  descripcion: "Este libro no trata de una introducción a la tecnología orientada a
  objetos ni al diseño orientado a objetos. Ya hay muchos libros que sirven bien a ese propósito.
  Por otro lado, tampoco es éste un avanzado tratado técnico.
  Es un libro de patrones de diseño que describe soluciones simples y elegantes para problemas 
  específicos del diseño de software orientado a objetos.En este libro, Erich Gamma, 
  Richard Helm, Ralph Johnson y John Vlissides introducen los principios de los patrones de 
  diseño y ofrecen un catálogo de dichos patrones. Así, este libro realiza dos importantes contribuciones. 
  En primer lugar, muestra el papel que los patrones pueden desempeñar diseñando la arquitectura de sistemas complejos. 
  En segundo lugar, proporciona una referencia práctica de un conjunto de excelentes patrones que el desarrollador 
  puede aplicar para construir sus propias aplicaciones.Una advertencia y unas palabras de ánimo: 
  no se preocupe si no entiende del todo este libro en la primera lectura. ¡Recuerde que no es un 
  libro para leer una vez y después ponerlo en una estantería! Esperamos que acuda a él una y otra 
  vez en busca de pistas de diseño y de inspiración."
)
  
producto2 = Producto.create(
  nombre: "Harry Potter y la piedra filosofal",
  precio: 15000,
  disponibilidad: 23,
  descripcion: "Harry Potter se ha quedado huérfano y vive en casa de sus abominables 
  tíos y del insoportable primo Dudley. Se siente muy triste y solo, hasta que un buen día 
  recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido 
  aceptado como alumno en el colegio interno Hogwarts de magia y hechicería."
)

producto3 = Producto.create(
  nombre: "Harry Potter y la camara secreta",
  precio: 12000,
  disponibilidad: 3,
  descripcion: "Mientras Harry espera impaciente en casa de sus insoportables tíos el inicio 
  del segundo curso del Colegio Hogwarts de Magia y Hechicería, un elfo aparece en su habitación 
  y le advierte de que una amenaza mortal se cierne sobre la escuela."
)

producto4 = Producto.create(
  nombre: "Calculo de Una Variable Trascendentes tempranas",
  precio: 70000,
  disponibilidad: 1,
  descripcion: "Cálculo de una variable Trascendentes tempranas es ampliamente 
  reconocido por su precisión matemática y la exactitud claridad de la exposición 
  y notables ejemplos y conjuntos de problemas. Millones de estudiantes en todo el 
  mundo han estudiado el cálculo a través del estilo registrado de Stewart mientras 
  que los instructores han adoptado su planteamiento una y otra vez. En la séptima 
  edición Stewart continúa estableciendo el estándar para el curso al tiempo que añade 
  contenido cuidadosamente revisado. Las pacientes explicaciones los soberbios ejercicios 
  centrados en la resolución de problemas y las series de ejercicios cuidadosamente graduadas 
  que han hecho de los textos de Stewart best sellers continúan proporcionando una base 
  sólida para la séptima edición. De los estudiantes más impreparados a los más talentosos 
  matemáticos la redacción y la presentación de Stewart sirven para mejorar el entendimiento y fomentar la confianza."
)


producto1.imagen.attach(io: File.open(
  Rails.root.join('app', 'assets', 'images', 'patrones_diseno.jpeg')
  ), filename: 'patrones_diseno.jpeg', content_type: 'image/jpeg')
producto2.imagen.attach(io: File.open(
  Rails.root.join('app', 'assets', 'images', 'harry_potter_1.jpeg')
  ), filename: 'harry_potter_1.jpeg', content_type: 'image/jpeg')
producto3.imagen.attach(io: File.open(
  Rails.root.join('app', 'assets', 'images', 'harry_potter_2.jpeg')
  ), filename: 'harry_potter_2.jpeg', content_type: 'image/jpeg')
producto4.imagen.attach(io: File.open(
  Rails.root.join('app', 'assets', 'images', 'stewart.jpeg')
  ), filename: 'stewart.jpeg', content_type: 'image/jpeg')

producto1.save!
producto2.save!
producto3.save!
producto4.save!
  