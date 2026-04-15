package cs3220.lab8;

import cs3220.lab8.model.Student;
import cs3220.lab8.model.SwimClass;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.NoSuchElementException;

@Component
public class DataStore {
    private final ArrayList<Student> entries;
    private final ArrayList<SwimClass> classes;

    private int nextId;
    private int nextClassId;

    public DataStore() {
        entries = new ArrayList<>();
        classes = new ArrayList<>();
        nextId = 1;
        nextClassId = 1;

        SwimClass session1Minnow = addClass(1, 2, "10-11am");
        SwimClass session2Starfish = addClass(2, 1, "9-10am");
        SwimClass session3Dolphin = addClass(3, 4, "2-3pm");
        SwimClass session4Guppies = addClass(4, 3, "1-2pm");

        addEntry("Alice", "2004", 1, "9-10am", "10-11am", 2, session2Starfish.getId());
        addEntry("Bob", "1999", 2, "10-11am", "1-2pm", 1, session1Minnow.getId());
        addEntry("Charlie", "2000", 3, "1-2pm", "2-3pm", 4, session4Guppies.getId());
        addEntry("David", "2005", 4, "2-3pm", "9-10am", 3, session3Dolphin.getId());
    }

    public void addEntry(String name, String birthYear, int level, String time1, String time2, int session) {
        addEntry(name, birthYear, level, time1, time2, session, 0);
    }

    public void addEntry(String name, String birthYear, int level, String time1, String time2, int session, int assignedClassId) {
        entries.add(new Student(name, birthYear, level, time1, time2, nextId++, session, assignedClassId));
    }

    public void deleteEntry(int id) {
        entries.removeIf(student -> student.getId() == id);
    }

    public void updateEntry(int id, String name, String birthYear, int level, String time1, String time2, int session) {
        for (int i = 0; i < entries.size(); i++) {
            if (entries.get(i).getId() == id) {
                Student existingStudent = entries.get(i);
                int assignedClassId = existingStudent.getAssignedClassId();
                if (assignedClassId != 0 && !canAssignToClass(session, level, time1, time2, assignedClassId)) {
                    assignedClassId = 0;
                }
                entries.set(i, new Student(name, birthYear, level, time1, time2, id, session, assignedClassId));
                return;
            }
        }

        throw new NoSuchElementException("No student entry found for id " + id);
    }

    public ArrayList<Student> getEntries() {
        return entries;
    }

    public Student getEntry(int id) {
        for (Student entry : entries) {
            if (entry.getId() == id) {
                return entry;
            }
        }

        throw new NoSuchElementException("No student entry found for id " + id);
    }

    public ArrayList<Student> getEntriesBySession(int session) {
        ArrayList<Student> students = new ArrayList<>();
        for (Student student: entries) {
            if (student.getSession() == session) {
                students.add(student);
            }
        }
        return students;
    }

    public ArrayList<SwimClass> getClassesBySession(int session) {
        ArrayList<SwimClass> sessionClasses = new ArrayList<>();
        for (SwimClass swimClass : classes) {
            if (swimClass.getSession() == session) {
                SwimClass populatedClass = new SwimClass(swimClass.getId(), swimClass.getSession(), swimClass.getTime(), swimClass.getLevel());
                for (Student student : entries) {
                    if (student.getAssignedClassId() == swimClass.getId()) {
                        populatedClass.addStudent(student);
                    }
                }
                sessionClasses.add(populatedClass);
            }
        }

        return sessionClasses;
    }

    public SwimClass addClass(int session, int level, String time) {
        for (SwimClass swimClass : classes) {
            if (swimClass.getSession() == session
                && swimClass.getLevel() == level
                && swimClass.getTime().equals(time)) {
                return swimClass;
            }
        }
        SwimClass swimClass = new SwimClass(nextClassId++, session, time, level);
        classes.add(swimClass);
        return swimClass;
    }

    public ArrayList<SwimClass> getAssignableClasses(int studentId) {
        Student student = getEntry(studentId);
        ArrayList<SwimClass> assignableClasses = new ArrayList<>();
        for (SwimClass swimClass : classes) {
            if (canAssignStudentToClass(student, swimClass)) {
                assignableClasses.add(swimClass);
            }
        }
        return assignableClasses;
    }

    public SwimClass getClassById(int classId) {
        for (SwimClass swimClass : classes) {
            if (swimClass.getId() == classId) {
                return swimClass;
            }
        }
        throw new NoSuchElementException("No class found for id " + classId);
    }

    public void assignStudentToClass(int studentId, int classId) {
        for (int i = 0; i < entries.size(); i++) {
            Student student = entries.get(i);
            if (student.getId() == studentId) {
                if (!canAssignToClass(student.getSession(), student.getLevel(), student.getTime1(), student.getTime2(), classId)) {
                    throw new IllegalArgumentException("Student cannot be assigned to class " + classId);
                }
                entries.set(i, new Student(
                    student.getName(),
                    student.getBirthYear(),
                    student.getLevel(),
                    student.getTime1(),
                    student.getTime2(),
                    student.getId(),
                    student.getSession(),
                    classId
                ));
                return;
            }
        }
        throw new NoSuchElementException("No student entry found for id " + studentId);
    }

    private boolean canAssignToClass(int session, int level, String time1, String time2, int classId) {
        SwimClass swimClass = getClassById(classId);
        return swimClass.getSession() == session
            && swimClass.getLevel() == level
            && (swimClass.getTime().equals(time1) || swimClass.getTime().equals(time2));
    }

    private boolean canAssignStudentToClass(Student student, SwimClass swimClass) {
        return swimClass.getSession() == student.getSession()
            && swimClass.getLevel() == student.getLevel()
            && (swimClass.getTime().equals(student.getTime1()) || swimClass.getTime().equals(student.getTime2()));
    }
}
