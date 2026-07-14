# 🏠 Real Estate Property Listings Portal

A web-based Real Estate Portal built using Java Spring Boot, JSP Servlets, and file-based data storage. Developed as part of the SE1020 – Object Oriented Programming module at SLIIT.

---

## 🛠️ Technologies Used

- **Backend:** Java, Spring Boot 3.5.14, JSP Servlets
- **Frontend:** HTML, CSS, JSP, Bootstrap 5
- **Data Storage:** File Read/Write (users.txt)
- **Build Tool:** Maven
- **Version Control:** Git & GitHub
- **IDE:** IntelliJ IDEA

---

---

## ⚙️ OOP Concepts Applied

### 1. Encapsulation
All fields in model classes are `private` with public getters and setters.
```java
private String name;
private String email;
public String getName() { return name; }
public void setName(String name) { this.name = name; }
```

### 2. Inheritance
`User` extends the abstract `BaseEntity` class which holds the common `id` field.
```java
public abstract class BaseEntity {
    private String id;
    public abstract String toFileString();
}

public class User extends BaseEntity {
    public User(String id, String name, ...) {
        super(id);
    }
}
```

### 3. Polymorphism
`FileHandler<T>` is a generic interface implemented by `UserFileHandler` — same method names, different implementations for different data types.
```java
public interface FileHandler<T extends BaseEntity> {
    void save(T entity);
    List<T> findAll();
    void update(T entity);
    void delete(String id);
}
```

### 4. Abstraction
`BaseEntity` contains the abstract method `toFileString()` which each subclass must implement.
```java
public abstract String toFileString();

// In User.java
@Override
public String toFileString() {
    return getId() + "|" + name + "|" + email + "|" + password + "|" + role;
}
```

---

## 📋 CRUD Operations (User Management)

| Operation | Where | Description |
|-----------|-------|-------------|
| **Create** | `register.jsp` → `UserServlet` → `UserService.register()` | Register a new user — saved to users.txt |
| **Read** | `login.jsp` → `UserServlet` → `UserService.login()` | Login by reading and matching from users.txt |
| **Update** | `profile.jsp` → `UserServlet` → `UserService.updateUser()` | Update user details — rewrites users.txt |
| **Delete** | `profile.jsp` → `UserServlet` → `UserService.deleteUser()` | Delete account — removes line from users.txt |

---
