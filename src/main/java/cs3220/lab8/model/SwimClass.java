package cs3220.lab8.model;

import java.util.ArrayList;

public class SwimClass {
    private final int id;
    private final int session;
    private final String time;
    private final int level;
    private final ArrayList<Student> students;

    public SwimClass(int id, int session, String time, int level) {
        this.id = id;
        this.session = session;
        this.time = time;
        this.level = level;
        this.students = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public int getSession() {
        return session;
    }

    public String getTime() {
        return time;
    }

    public int getLevel() {
        return level;
    }

    public String getLevelName() {
        return switch (level) {
            case 1 -> "Starfish";
            case 2 -> "Minnow";
            case 3 -> "Guppies";
            case 4 -> "Dolphin";
            default -> "Unknown";
        };
    }

    public ArrayList<Student> getStudents() {
        return students;
    }

    public void addStudent(Student student) {
        students.add(student);
    }
}
