package cs3220.lab8.model;

import java.time.Year;

public class Student {
    private final String name;
    private final String birthYear;
    private final int level;
    private final String time1;
    private final String time2;
    private final int id;
    private final int session;
    private final int assignedClassId;

    public Student(String name, String birthYear, int level, String time1, String time2, int id, int session) {
        this(name, birthYear, level, time1, time2, id, session, 0);
    }

    public Student(String name, String birthYear, int level, String time1, String time2, int id, int session, int assignedClassId) {
        this.id = id;
        this.name = name;
        this.birthYear = birthYear;
        this.level = level;
        this.time1 = time1;
        this.time2 = time2;
        this.session = session;
        this.assignedClassId = assignedClassId;
    }

    public String getName() {
        return name;
    }

    public String getBirthYear() {
        return birthYear;
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

    public String getTime1() {
        return time1;
    }

    public String getTime2() {
        return time2;
    }

    public int getId() {
        return id;
    }

    public int getSession() {
        return session;
    }

    public int getAssignedClassId() {
        return assignedClassId;
    }

    public boolean isAssigned() {
        return assignedClassId != 0;
    }

    public int getAge() {
        int currentYear = java.time.Year.now().getValue();
        int age = currentYear - Integer.parseInt(birthYear);
        return age;
    }
}
