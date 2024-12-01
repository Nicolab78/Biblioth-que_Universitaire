
-- Table des étudiants
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    program VARCHAR(100) NOT NULL
);

-- Table des professeurs
CREATE TABLE professors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

-- Table des employés
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(100) NOT NULL
);

-- Table des utilisateurs (login/register)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'professor', 'employee') NOT NULL, -- Rôle de l'utilisateur
    student_id INT, -- Référence à un étudiant
    professor_id INT, -- Référence à un professeur
    employee_id INT, -- Référence à un employé
    FOREIGN KEY (student_id) REFERENCES students(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table des salles de classe
CREATE TABLE classrooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

-- Table des cours
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    professor_id INT, -- Référence au professeur
    classroom_id INT, -- Référence à la salle de classe
    FOREIGN KEY (professor_id) REFERENCES professors(id),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(id)
);

-- Table des notes
CREATE TABLE grades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT, -- Référence à un étudiant
    course_id INT, -- Référence à un cours
    grade FLOAT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Table des devoirs
CREATE TABLE assignments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    due_date DATE NOT NULL,
    course_id INT, -- Référence au cours
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Table des devoirs soumis
CREATE TABLE submitted_assignments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT, -- Référence au devoir
    student_id INT, -- Référence à un étudiant
    submission_date DATE NOT NULL,
    grade FLOAT, -- Note du devoir soumis
    FOREIGN KEY (assignment_id) REFERENCES assignments(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);
