@import cs3220.lab8.model.Student
@import cs3220.lab8.model.SwimClass
@import java.util.ArrayList

@param Student student
@param ArrayList<SwimClass> assignableClasses
@param SwimClass assignedClass

@template.layout(title = "View", content = @`
    <h2>Student Information</h2>
    <div class="card mb-4">
        <div class="card-body">
            <p><strong>Id:</strong> ${student.getId()}</p>
            <p><strong>Name:</strong> ${student.getName()}</p>
            <p><strong>Age:</strong> ${student.getAge()}</p>
            <p><strong>Session:</strong> ${student.getSession()}</p>
            <p><strong>Level:</strong> ${student.getLevelName()}</p>
            <p><strong>Preferred Time 1:</strong> ${student.getTime1()}</p>
            <p><strong>Preferred Time 2:</strong> ${student.getTime2()}</p>
            <p>
                <strong>Assigned Class:</strong>
                @if(student.isAssigned())
                    Session ${assignedClass.getSession()}, ${assignedClass.getLevelName()}, ${assignedClass.getTime()}
                @else
                    Unassigned
                @endif
            </p>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <h3 class="h5 mb-3">Assign Student to Class</h3>
            @if(assignableClasses.isEmpty())
                <p class="mb-0">No matching classes are available for this student. Create one that matches the student's session, level, and preferred times.</p>
            @else
                <form method="post" action="/assign/${student.getId()}">
                    <div class="row g-3 align-items-end">
                        <div class="col-12 col-md-9">
                            <label class="form-label" for="class-select">Available Classes</label>
                            <select class="form-select" name="classId" id="class-select">
                                @for(SwimClass swimClass : assignableClasses)
                                    @if(student.getAssignedClassId() == swimClass.getId())
                                        <option value="${swimClass.getId()}" selected>Session ${swimClass.getSession()} | ${swimClass.getLevelName()} | ${swimClass.getTime()}</option>
                                    @else
                                        <option value="${swimClass.getId()}">Session ${swimClass.getSession()} | ${swimClass.getLevelName()} | ${swimClass.getTime()}</option>
                                    @endif
                                @endfor
                            </select>
                        </div>
                        <div class="col-12 col-md-3">
                            <button class="btn btn-primary w-100" type="submit">Assign</button>
                        </div>
                    </div>
                </form>
            @endif
        </div>
    </div>
`)
